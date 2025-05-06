import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';


class CustomFloatingActionButton extends StatelessWidget {

  final VoidCallback onPressed;

  final IconData icon;


  final double iconSize;


  final Color backgroundColor;

  final Color iconColor;


  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.icon = Icons.add,
    this.iconSize = 40,
    this.backgroundColor = AppColors.readyForCollectionColor, // Replace with AppColors.readyForCollectionColor
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      shape: const CircleBorder(),
    );
  }
}