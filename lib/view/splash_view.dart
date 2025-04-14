import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/auth/select_account_view.dart';
import '../main.dart';
import '../utils/app_colors.dart';
import '../utils/notification_service.dart';
import '../utils/shared_keys.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  // NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // notificationServices.requestNotificationPermissions();
    // notificationServices.foregroundMessage();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // notificationServices.isTokenRefresh();
    // notificationServices.getDeviceToken();
    configLoading();
    Future.delayed(const Duration(milliseconds: 1000),(){
      Get.to(()=> SelectAccountView());
      // Get.find<AuthController>().apiLogin(phoneNo: preferences.getString(SharedKeys.keyPhoneNo) ?? "", password: preferences.getString(SharedKeys.keyPswd) ?? "", fromSplash: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_img.png"),
              fit: BoxFit.fill
          ),
        ),
        child: Center(child: Image.asset("assets/splash_logo.png"),),
      ),
    );
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppColors.whiteColor
      ..backgroundColor = AppColors.primaryColor
      ..indicatorColor = AppColors.whiteColor
      ..textColor = AppColors.whiteColor
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
