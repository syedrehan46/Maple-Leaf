import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

import '../../utils/custom widgets/custom_appbar.dart';
class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make the scaffold transparent
      body: Stack(


        children: [
          // Background Image - Full screen
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Foreground Content
          Column(
            children: [
              CustomAppbar(title: 'jobs', timeLocationIsVisible: true),
              SizedBox(height: 20,),
              Text('NO Jobs Avalible Today',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent)),
            ],
          ),

        ],
      ),

    );
  }
}
