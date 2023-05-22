import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init() async {
    try {
      var initAndroidSettings =
          const AndroidInitializationSettings('notification_logo');
      final settings = InitializationSettings(android: initAndroidSettings);
      await _notification.initialize(settings,
          onDidReceiveNotificationResponse: _onDidReceiveLocalNotification,
          onDidReceiveBackgroundNotificationResponse: onSelectNotification);
    } catch (e) {
      print(e.toString());
    }
  }

  static _onDidReceiveLocalNotification(NotificationResponse respone) async {
    print('respone');
  }

  static onSelectNotification(NotificationResponse respone) async {
    print('payload ');
  }

  static Future showNotification(
      {var id = 0, var title, var body, var payload}) async {
    _notification.show(id, title, body, await notificationDetails());
  }

  static Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledNotificationDateTime}) async {
    try {
      return _notification.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(
            scheduledNotificationDateTime,
            tz.local,
          ),
          await notificationDetails(),
          payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    } catch (e) {
      print(e.toString());
    }
  }

  static notificationDetails() async {
    try {
      return const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel id 13',
            'channel name',
            importance: Importance.max,
            enableVibration: true,
            sound: RawResourceAndroidNotificationSound('notify_alarm'),
          ),
          iOS: DarwinNotificationDetails(sound: 'notify_alarm.mp3'));
    } catch (e) {
      print(e.toString());
    }
  }
}
