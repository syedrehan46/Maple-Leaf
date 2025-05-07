import 'package:flutter/material.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/menu_bg.png"),
          fit: BoxFit
              .cover, // Changed from fill to cover for better scaling
        ),
      ),
    );
  }
}
