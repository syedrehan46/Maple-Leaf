import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
late FToast fToast;
void CustomToastText(
    String message, {
      required BuildContext context,
      String iconPath = 'assets/images/leaf_ic.png', // default value
    }) {
  fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey.shade700,
    ),
    child: Row(
      children: [
        Image.asset(iconPath, height: 20, width: 20),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: const Duration(milliseconds: 1200),
  );
}
