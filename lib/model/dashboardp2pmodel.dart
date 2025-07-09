import 'package:flutter/cupertino.dart';

class DashboardItemModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;


  DashboardItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}