import 'package:flutter/material.dart';

import '../../application/services/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Local Notification"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           
          },
          child: const Text("Get Notification"),
        ),
      ),
    );
  }
}
