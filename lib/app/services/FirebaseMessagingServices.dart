import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/notification_model.dart';

class FirebaseMessagingService extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void configureFirebaseMessaging(
      Function(NotificationModel) onNotificationReceived) async {
    await _messaging.requestPermission();
    await _messaging.getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      SnackBar(
          content: Text(
              'Received message: ${message.notification!.title} - ${message.notification!.body}'));

      if (message.notification != null) {
        final notification = NotificationModel(message: '', 
        title: '',
         imageUrl: message.notification.toString(),
         linkUrl: message.data['linkUrl'], 
         readStatus: message.data['read_status'], 
         createdAt: message.data['created_at'],
          updatedAt: message.data['updated_at']);
        // NotificationModel(
        //   title: message.notification!.title ?? '',
        //   body: message.notification!.body ?? '',
        //   imageUrl: message.data['image'] ?? '',
        //   linkUrl: message.data['link'] ?? '',
        //   avatar: '',
        //   name: '',
        //   message: '',
        //   date: '',
        // );

        onNotificationReceived(notification);
        showNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notification = 
   NotificationModel(message: '', 
        title: '',
         imageUrl: message.notification.toString(),
         linkUrl: message.data['linkUrl'], 
         readStatus: message.data['read_status'], 
         createdAt: message.data['created_at'],
          updatedAt: message.data['updated_at']);
        // NotificationModel(
        //   title: message.notification!.title ?? '',
        //   body: message.notification!.body ?? '',
        //   imageUrl: message.data['image'] ?? '',
        //   linkUrl: message.data['link'] ?? '',
        //   avatar: '',
        //   name: '',
        //   message: '',
        //   date: '',
        // );

        onNotificationReceived(notification);
      }
    });
  }

  // void initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('app_icon');

  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }

  void showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.high,
      priority: Priority.high,
      largeIcon: DrawableResourceAndroidBitmap('your_large_icon'),
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // final imageUrl = message.data['image'];
    final linkUrl = message.data['link'];

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title ?? '',
      message.notification!.body ?? '',
      platformChannelSpecifics,
      payload: linkUrl,
    );
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = await _messaging.getToken();
    return deviceToken;
  }
}
