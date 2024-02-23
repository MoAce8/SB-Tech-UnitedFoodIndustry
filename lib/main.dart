// ignore_for_file: deprecated_member_use, avoid_print

import 'package:api_request/api_request.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitedfoodindustery/core/constants/theme.dart';
import 'package:unitedfoodindustery/core/utiles/di.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/login_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/splash/splash_screen.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/tabs_screen.dart';
import 'core/constants/constants.dart';
import 'core/network/appbinding.dart';
import 'core/router/router.dart';
import 'core/utiles/bloc_observer.dart';
import 'generator/codegen_loader.dart';
import 'generator/localization_constant.dart';
import 'dart:ui';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    importance: Importance.high, playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding.initAsyncDependebcies();
  initDI();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  ApiRequestOptions.instance?.config(
    baseUrl: 'https://mal3aby.dlt-development.net/api',
    tokenType: ApiRequestOptions.bearer,
    getToken: () => prefs.getString('token') ?? '',
    enableLog: true,

  );

  BlocOverrides.runZoned(
        () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', ''),
          // Locale('tr', ''),
        ],
        path: 'asset/translation',
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      if(message.data['Type']=='2'){
       }
      if(message.data['Type']=='5'||message.data['Type']=='3'||message.data['Type']=='6'){
        }
    }
  });
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  setLocale(Locale locale) async {
    setState(() {
      context.locale = locale;
    });
    print('Applan:$locale');
  }

  // @override
  // void didChangeDependencies() {
  //   getLocale().then((locale) {
  //     setState(() {
  //       context.locale = locale;
  //       context.locale = Locale('ar', '');
  //     });
  //   });
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) => child!,
      child: MaterialApp(
        title: 'United Food Industry',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: themeData,
        home: const LoginScreen(),
      ),
    );
  }
}
