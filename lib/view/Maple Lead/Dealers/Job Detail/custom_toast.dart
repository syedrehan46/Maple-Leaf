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

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Colors.grey.shade600.withOpacity(0.85),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // Makes the row wrap its content
      children: [
        ClipOval(
          child: Image.asset(
            "assets/images/ic_launcher.png",
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 14),
        Flexible( // Better than Expanded here
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
            softWrap: true,
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(milliseconds: 1300),
  );
}
