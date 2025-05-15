import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
late FToast fToast;

void CustomToastText(String message) {
  fToast = FToast();
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey.shade700,
    ),
    child: Row(
      children: [
        Image.asset("assets/images/leaf_ic.png",height: 20,width: 20,),
        SizedBox(width: 20,),
        Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(milliseconds: 1200),
  );
}