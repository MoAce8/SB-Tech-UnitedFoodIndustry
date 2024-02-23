import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:unitedfoodindustery/notification/model.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final didReceivedLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
  InitializationSettings? initializationSettings;

  static final NotificationService _instance = NotificationService._();

  NotificationService._() {
    init();
  }

  factory NotificationService(){
    return _instance;
  }

  init() async {
    log("Initialised flutter local notifications");
    _initializePlatformSpecifies();
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
    log("Initialised flutter local notifications 2");
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
  }

  _initializePlatformSpecifies() {
    print("111111111111111");
    const initialAndroidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    final initialIosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int? id, String? title, String? body, String? payload) async {
          ReceivedNotification receivedNotification = ReceivedNotification(
              id: id!, title: title!, body: body!, payload: payload!);
          didReceivedLocalNotificationSubject.add(receivedNotification);
        });

    initializationSettings = InitializationSettings(
        android: initialAndroidSettings, iOS: initialIosSettings);
  }

  _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: false,
      badge: false,
      sound: true,
    );
  }

  static const AndroidNotificationDetails _androidNotificationDetails =
  AndroidNotificationDetails(
    '0',
    "sHRM",
    channelDescription:
    "This channel is responsible for all the local notifications",
    playSound: true,
    enableVibration: true,
    // sound: RawResourceAndroidNotificationSound('alert_tones'),
    priority: Priority.high,
    importance: Importance.max,
  );
  static const DarwinNotificationDetails _iOSNotificationDetails =
  DarwinNotificationDetails();

  final NotificationDetails notificationDetails = const NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  setListenerForLowerVersion(Function onNotificationForLowerVersion) {
    didReceivedLocalNotificationSubject.listen((receivedNotification) {
      onNotificationForLowerVersion(receivedNotification);
    });
  }
late final map;
  setOnNotificationClick(Function onNotificationClick) async {
    final details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      print("serz");
      print(details.notificationResponse?.payload);
      ReceivedNotification receivedNotification = ReceivedNotification(
          id: 0,
          title: '',
          body: '',
          payload: details.notificationResponse?.payload);
      didReceivedLocalNotificationSubject.add(receivedNotification);
    }

    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings!,
        onDidReceiveNotificationResponse: (payload) {

          print("serb");
          print(payload.payload);
          onNotificationClick(payload.payload);
          return;
        });
  }

  ///regular notification
  Future<void> showNotification({title, body, payload}) async {
    // const androidChannelSpecifies = AndroidNotificationDetails(
    //   '0',
    //   '24Hour',
    //   importance: Importance.high,
    //   priority: Priority.high,
    //   tag: '24Hour',
    //   playSound: true,
    //   enableVibration: true,
    //   sound: RawResourceAndroidNotificationSound('alert_tones'),
    //   visibility: NotificationVisibility.public,
    //   styleInformation: BigTextStyleInformation(''),
    // );

    flutterLocalNotificationsPlugin
        .show(0,

        '$title', '$body', notificationDetails, payload: payload);
  }

  Future initializeTimeZone() async {
    tz.initializeTimeZones();
  }

  ///scheduled notification
  Future<void> scheduleNotification(int id, String title, String body, int hour,
      int minute, int second) async {
    tz.initializeTimeZones();

    final scheduleTime = DateTime.now();

    Duration offsetTime = DateTime.now().timeZoneOffset;

    if (kDebugMode) {
      print('hour : $hour  min : $minute  sec : $second');
    }

    if (kDebugMode) {
      print('schedule : ${scheduleTime.toString()}');
    }

    if (kDebugMode) {
      print('offsetTime : ${offsetTime.toString()}');
    }

    tz.TZDateTime tzDateTime = tz.TZDateTime.local(scheduleTime.year,
        scheduleTime.month, scheduleTime.day, hour, minute, second, 0, 0)
        .subtract(offsetTime);
    if (tzDateTime.isBefore(scheduleTime)) {
      log('is before $tzDateTime');
      tzDateTime = tzDateTime.add(const Duration(days: 1));
    }

    NotificationDataModel notificationData = NotificationDataModel(
        id: 0, body: '', title: '', type: 'check-in', image: null, url: '');

    String payload = json.encode(notificationData.toJson());

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, tzDateTime, notificationDetails,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: payload);
  }

  Future<void> showNotificationWithAttachment(
      {title, body, image, payload = 'payload'}) async {
    final bigPicture = await _downloadAndSaveFile('$image', 'bigPicture');
    final largeIcon = await _downloadAndSaveFile('$image', 'largeIcon');
    final iosPlatformSpecifies = DarwinNotificationDetails(
      attachments: [DarwinNotificationAttachment(bigPicture)],
    );
    final bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicture),
      largeIcon: FilePathAndroidBitmap(largeIcon),
      contentTitle: '<b>$title</b>',
      htmlFormatContentTitle: true,
      summaryText: '<p>$body</p>',
      htmlFormatSummaryText: true,
    );
    final androidChannelSpecifies = AndroidNotificationDetails('sHRM', 'sHRM',
        priority: Priority.high,
        importance: Importance.high,
        channelShowBadge: true,
        styleInformation: bigPictureStyleInformation);
    final notificationDetails = NotificationDetails(
        android: androidChannelSpecifies, iOS: iosPlatformSpecifies);
    await flutterLocalNotificationsPlugin
        .show(0, '$title', '$body', notificationDetails, payload: payload);
  }

  _downloadAndSaveFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final response = await http.get(Uri.parse(url));
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> repeatNotification() async {
    const androidChannelSpecifies = AndroidNotificationDetails(
        'CHANNEL_ID 3', 'CHANNEL_NAME 3',
        importance: Importance.high, priority: Priority.high);
    const iosChannelSpecifies = DarwinNotificationDetails();
    const platformChannelSpecifies = NotificationDetails(
        android: androidChannelSpecifies, iOS: iosChannelSpecifies);
    flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeat title',
        'repeat body', RepeatInterval.everyMinute, platformChannelSpecifies,
        payload: 'payload');
  }
}

class ReceivedNotification {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;

  ReceivedNotification({this.id, this.title, this.body, this.payload});
}
