// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:news_paper/domain/entity/push_notification.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class InitApp {
  static Future<void> init() async {
    CustomLocator.initLocator();
    Firebase.initializeApp();
  }

  late final FirebaseMessaging _messaging;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  }

  void initState() {
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
    });
  }
}
