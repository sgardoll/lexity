import 'package:web/web.dart' as web;

void clearWebPushNotificationParameter() {
  final uri = Uri.base;
  final queryParameters = Map<String, String>.of(uri.queryParameters)
    ..remove('ffPushNotification');
  final cleanedUri = uri.replace(queryParameters: queryParameters);
  web.window.history.replaceState(null, '', cleanedUri.toString());
}
