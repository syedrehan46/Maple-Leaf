import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_strings.dart';
import 'package:mapleleaf/view/Mapping/mapping_view.dart';
import 'package:mapleleaf/view/dashboard/dashboardp2p.dart';
import 'package:mapleleaf/view/dashboard/ule_dashboard_view.dart';
import 'package:mapleleaf/view/painter%20engagement/Engaged%20Painter/Painter_list.dart';
import 'package:mapleleaf/view/painter%20engagement/Engaged%20Painter/add_lead.dart';
import 'package:mapleleaf/view/painter%20engagement/Engaged%20Painter/engaged_painter.dart';
import 'package:mapleleaf/view/painter%20engagement/painter_engagement_view.dart';
import 'package:mapleleaf/view/splash_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/controller_bindings.dart';
import 'package:flutter/services.dart';
late Directory myAppDir;
late SharedPreferences preferences;
late String appVersion;
late String deviceModel;
late String deviceManufacture;
late String devicePlatform;
late String serialNumber;
late String token;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([

    DeviceOrientation.portraitUp,

    DeviceOrientation.portraitDown,

  ]);

  myAppDir = await path_provider.getApplicationDocumentsDirectory();

  preferences = await SharedPreferences.getInstance();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  appVersion = packageInfo.version;

  await fetchDeviceInfo();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(

    statusBarColor: AppColors.primaryColor,

  ));

  runApp(const MyApp());
}

fetchDeviceInfo() async{
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if(Platform.isAndroid){
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceModel = androidInfo.model;
    devicePlatform = "Android";
    deviceManufacture = androidInfo.manufacturer;
    serialNumber = androidInfo.id;
  }
  else{
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceModel = iosInfo.model;
    deviceManufacture = "Apple";
    devicePlatform = "iOS";
    serialNumber = iosInfo.identifierForVendor ?? "";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    return ScreenUtilInit(
      designSize: screenWidth > 550 ? const Size(480, 800) :const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            fontFamily: AppStrings.fontFamilyHarmoniaRegular,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          initialBinding: ControllerBindings(),
          home: child,
          builder: EasyLoading.init(),
        );
      },
      child: MappingView(),
      // UleDashboardView(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}