import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomDropdownButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "assets/images/ic_filter.png",
        height: 20,
        width: 20,
        color: Colors.white, // optional tint
      ),
    );
  }
}
