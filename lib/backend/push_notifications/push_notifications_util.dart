
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

export 'push_notifications_handler.dart';
export 'serialization_util.dart';

/// The account-level opt-out: when the linked settings document says
/// notifications are off, no token may be registered for the user.
/// Missing documents/preferences default to enabled so existing accounts
/// keep receiving pushes until they explicitly switch them off.
Future<bool> _notificationsEnabled(String userPath) async {
  try {
    final userDoc = await FirebaseFirestore.instance.doc(userPath).get();
    final settingsRef = userDoc.data()?['settings'];
    if (settingsRef is! DocumentReference) {
      return true;
    }
    final settingsDoc = await settingsRef.get();
    final data = settingsDoc.data();
    return data is Map ? data['notificationsOn'] != false : true;
  } catch (_) {
    // A rules/network failure must not silently un-register tokens.
    return true;
  }
}

class UserTokenInfo {
  const UserTokenInfo(this.userPath, this.fcmToken);
  final String userPath;
  final String fcmToken;
}

// Value doubles as the local enabled flag: the settings toggle adds true/false
// to opt in or out; permission prompts re-emit the current value purely as a
// re-evaluation trigger. Gating on it closes the window where deleteToken()'s
// replacement arrives before the settings write is visible server-side.
final kNotificationsBehaviorSubject = BehaviorSubject<bool>.seeded(true);

Stream<UserTokenInfo> getFcmTokenStream(String userPath) =>
    kNotificationsBehaviorSubject.stream
        .where((_) =>
            kIsWeb ||
            defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android)
        .asyncMap<String?>((enabled) async {
          if (!enabled) {
            return null;
          }
          if (kIsWeb && !await FirebaseMessaging.instance.isSupported()) {
            return null;
          }
          final settings =
              await FirebaseMessaging.instance.getNotificationSettings();
          if (settings.authorizationStatus == AuthorizationStatus.authorized) {
            return FirebaseMessaging.instance.getToken(
                vapidKey: kIsWeb
                    ? "BGwD3X6zGe6ubqBQSYEqwUdKOEPWXEZVxrOij1qoWSE8t0MJxqsESClWNXP0FJAgUxJm6AIKEQA9bD7um-i-3nE"
                    : null);
          }
          return null;
        })
        .switchMap((fcmToken) => Stream.value(fcmToken)
            .merge(FirebaseMessaging.instance.onTokenRefresh))
        .where((fcmToken) => fcmToken != null && fcmToken.isNotEmpty)
        // The local flag gates first — a token refresh emitted by deleteToken()
        // must not re-register while notifications are off — then the saved
        // preference is checked after the merge so a refresh emitted while off
        // cannot re-register either.
        .where((_) => kNotificationsBehaviorSubject.value)
        .asyncMap<String?>((token) async =>
            await _notificationsEnabled(userPath) ? token : null)
        .where((token) => token != null)
        .map((token) => UserTokenInfo(userPath, token!));

final fcmTokenUserStream = authenticatedUserStream
    .where((user) => user != null)
    .map((user) => user!.reference.path)
    .distinct()
    .switchMap(getFcmTokenStream)
    .map(
      (userTokenInfo) => makeCloudCall(
        'addFcmToken',
        {
          'userDocPath': userTokenInfo.userPath,
          'fcmToken': userTokenInfo.fcmToken,
          'deviceType': kIsWeb
              ? 'Web'
              : (defaultTargetPlatform == TargetPlatform.iOS
                  ? 'iOS'
                  : 'Android'),
        },
      ),
    );
