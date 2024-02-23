import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unitedfoodindustery/notification/model.dart';
import 'package:unitedfoodindustery/notification/notification_service.dart';

class BottomNavController extends ChangeNotifier {
  ///FirebaseMessaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // final PageController myPage = PageController(initialPage: 0);
  bool expended = false;
  int currentScreenIndex = 0;

  BottomNavController() {
    print("!@!@!@!@!@!@");
    sendToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {


      ///encode message.data as payload(String format)
      ///whenever to use payload we have to decode to as map
      final encodedString = json.encode(message.data);

      ///parsing message.data to model data
      NotificationDataModel notification = NotificationDataModel.fromJson(message.data);
      print(encodedString);
      print(notification.title);
      print(message.data);
      print("seroo");
      ///checking if title null or not if null no notification wi show
      if (notification.image == null) {
        await NotificationService().showNotification(
            title: message.notification?.title,
            body: message.notification?.body,

            payload: encodedString);
        return;
      } else {
        await NotificationService().showNotificationWithAttachment(
            title: message.notification?.title,
            body: message.notification?.body,
            image: notification.image,

            payload: encodedString);
      }
    });

    NotificationService().didReceivedLocalNotificationSubject.listen((value) {
      print(value);
      print("gerges asher");
      onNotificationClick(value.payload);
    });

    ///setNotificationClickListenerForLowerVersion
    NotificationService().setListenerForLowerVersion(onNotificationInLowerVersions);

    ///setNotificationClickListener
    NotificationService().setOnNotificationClick(onNotificationClick);
  }

  sendToken() {
    _firebaseMessaging.getToken().then((value) async {
      ///store device token to server
      ///for getting notification
      if (kDebugMode) {
        print('token firebase $value');
      }
    });
  }

  ///notification click event for lower version
  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    if (kDebugMode) {
      print(receivedNotification.body);
    }
  }

  ///notification click event
  onNotificationClick(payload) {

    if (payload != null) {
      final map = json.decode(payload);

      if(map['Type']=='2'){
      }
      if(map['Type']=='5'||map['Type']=='3'||map['Type']=='6'){
         }
      else{

      }
    }
  }
}
