//
// import 'dart:io';
// import 'package:app_settings/app_settings.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mapleleaf/utils/shared_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'app_colors.dart';
//
// class NotificationServices{
//
//   //region Firebase & LocalNotification instance Initialization
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   //endregion
//
//   //region Request Permissions
//   void requestNotificationPermissions() async{
//     NotificationSettings settings = await messaging.requestPermission(
//         sound: true,
//         provisional: true,
//         criticalAlert: true,
//         carPlay: true,
//         badge: true,
//         announcement: true,
//         alert: true
//     );
//
//     if(settings.authorizationStatus == AuthorizationStatus.authorized){
//       if (kDebugMode) {
//         print("user granted permission");
//       }
//     }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
//       if (kDebugMode) {
//         print("user granted provisional permission");
//       }
//     }else{
//       if (kDebugMode) {
//         print("user not gave the permission");
//       }
//       AppSettings.openAppSettings();
//     }
//
//   }
//   //endregion
//
//   //region initialize Local Notifications
//   void initLocalNotifications(BuildContext context, RemoteMessage message) async{
//     var androidInitializationSettings = const AndroidInitializationSettings('@drawable/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();
//
//     var initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (payload){
//         handleMessage(context, message);
//       },
//     );
//   }
//   //endregion
//
//   //region Firebase initialization
//   void firebaseInit(BuildContext context){
//     FirebaseMessaging.onMessage.listen((message){
//
//       if (kDebugMode) {
//         print("Foreground Notification: ${message.notification?.title}");
//         print("title ${message.notification?.title.toString()}");
//         print("body ${message.notification?.body.toString()}");
//         print("data ${message.data.toString()}");
//       }
//       if(Platform.isAndroid){
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }else{
//         foregroundMessage();
//         showNotification(message);
//       }
//     });
//   }
//   //endregion
//
//   //region Show Notification
//   Future<void> showNotification(RemoteMessage message) async{
//
//     if (message.messageId == null) return;
//
//     AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       'high_importance_channel', // Use a consistent channel ID
//       'High Importance Notifications',
//       importance: Importance.max,
//     );
//
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString(),
//       channelDescription: "your channel description",
//       icon: '@drawable/ic_launcher',
//       color: AppColors.primaryColor,
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: "ticker",
//     );
//
//     DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );
//
//     Future.delayed(Duration.zero, (){
//       // Avoid triggering duplicate notifications
//       _flutterLocalNotificationsPlugin.show(
//         message.messageId.hashCode,
//         message.notification?.title,
//         message.notification?.body,
//         notificationDetails,
//       );
//     });
//
//   }
//   //endregion
//
//   //region Get Device Tokens
//   Future<void> getDeviceToken() async {
//     if(Platform.isAndroid){
//       String? token = await messaging.getToken();
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       preferences.setString(SharedKeys.keyFirebaseToken, token ?? "");
//       print('***=> FCM Token: $token <=***');
//     } else{
//       getAPNSToken();
//     }
//   }
//
//   void isTokenRefresh() async{
//     messaging.onTokenRefresh.listen((event){
//       event.toString();
//       print('***=> FCM TokenRefresh: $event <=***');
//     });
//   }
//
//   Future<void> getAPNSToken() async{
//     await FirebaseMessaging.instance.subscribeToTopic('anicsun_case');
//     if (Platform.isIOS) {
//       print('***=> Getting APNs token... <=***');
//       String? token = await FirebaseMessaging.instance.getAPNSToken().then((value) async{
//         return await messaging.getToken();
//       });
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       preferences.setString(SharedKeys.keyFirebaseToken, token ?? "");
//       print('***=> Got APNs token: $token <=***');
//     }
//   }
//   //endregion
//
//   //region Handle Navigation Terminated / Open
//   Future<void> setupInteractMessage(BuildContext context) async{
//     //Terminated
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if(initialMessage != null){
//       handleMessage(context, initialMessage);
//     }
//
//     //OpenApp
//     FirebaseMessaging.onMessageOpenedApp.listen((event){
//       handleMessage(context, event);
//     });
//   }
//   //endregion
//
//   //region Handle Navigation
//   void handleMessage(BuildContext context, RemoteMessage message) {
//     if(message.data['screen'] == "msg"){
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> MessageScreen(id: message.data['id'].toString(),)));
//     }
//   }
//   //endregion
//
//   //region Foreground Ios
//   Future foregroundMessage() async{
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
// }