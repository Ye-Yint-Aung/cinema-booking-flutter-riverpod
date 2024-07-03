import 'package:flutter/material.dart';
import 'package:riverpod_demo/application/services/notification.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  NotificationHelper notificationHelper = NotificationHelper();
  @override
  void initState() {
    super.initState();
    notificationHelper.initialNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  notificationHelper.sendNotification("00126");
                  //LocalNotifications.showSimpleNotification(title: "Simple Notification", body: "This is a simple notification", payload: "This is simple data");
                },
                label: const Text("Get Notification"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
