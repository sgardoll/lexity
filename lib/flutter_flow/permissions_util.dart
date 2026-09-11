import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/backend/push_notifications/push_notifications_util.dart';

const kPermissionStateToBool = {
  PermissionStatus.granted: true,
  PermissionStatus.limited: true,
  PermissionStatus.denied: false,
  PermissionStatus.restricted: false,
  PermissionStatus.permanentlyDenied: false,
};

final notificationsPermission = Permission.notification;

Future<bool> getPermissionStatus(Permission setting) async {
  if (setting == Permission.notification && kIsWeb) {
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  final status = await setting.status;
  return kPermissionStateToBool[status]!;
}

Future<void> requestPermission(Permission setting) async {
  if (setting == Permission.notification && kIsWeb) {
    final settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      kNotificationsBehaviorSubject.add(false);
    }
    return;
  }

  if (setting == Permission.photos && isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      await Permission.storage.request();
    } else {
      await Permission.photos.request();
    }
  }
  await setting.request();
  if (setting == Permission.notification) {
    kNotificationsBehaviorSubject.add(false);
  }
}
