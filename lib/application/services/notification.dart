import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

  initialNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String code) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId", "Flutter", icon: '@mipmap/ic_launcher', importance: Importance.max, priority: Priority.max);
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    print("##### Send Function ${notificationDetails.android!.channelName}");
    await flutterLocalNotificationsPlugin.show(0, "OTP CODE", "$code", notificationDetails);
  }
}
