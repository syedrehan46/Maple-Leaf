import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class ForceUpdateAlert extends StatefulWidget {
  final String msg;
  ForceUpdateAlert(this.msg);
  @override
  _ForceUpdateAlertState createState() => _ForceUpdateAlertState();
}

class _ForceUpdateAlertState extends State<ForceUpdateAlert> {


  Future<bool> onWillPop() async{
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 280.0.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image(
                            image: AssetImage('assets/images/arrowdown.png'),
                            height: 50.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "App Update Available",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            //widget.msg,
                            "Please Update Your App",
                            style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            // height: 35.h,
                            // width: 150.w,
                            margin: EdgeInsets.symmetric(horizontal: 65.w),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (Platform.isAndroid) {
                                  launch(AppStrings.androidAppUrl);
                                } else if (Platform.isIOS) {
                                  launch(AppStrings.iosAppUrl);
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(17),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
