import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
late FToast fToast;
void CustomToast(
    String message, {
      required BuildContext context,

    }) {
  fToast = FToast();
  fToast.init(context);

  Widget toast = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade700,
      ),
      child: Row(
        children: [
          Image.asset("assets/images/ic_launcher.png", height: 20, width: 20),
           const SizedBox(width: 14),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(milliseconds: 1200),
  );
}
