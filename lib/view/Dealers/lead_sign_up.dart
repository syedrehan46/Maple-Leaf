import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';
import 'package:mapleleaf/view/Dealers/sign_up_controller.dart';
import 'package:mapleleaf/view/auth/change_password_view.dart';
import 'package:mapleleaf/view/dashboard/dashboardp2p.dart';

import 'custom_textfield.dart'; // Make sure this file contains `lightOrange`

class LeadSignUp extends StatefulWidget {
  const LeadSignUp({super.key});

  @override
  State<LeadSignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LeadSignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Sign Up", style: AppFonts.styleHarmoniaBold18W600(),),
                SizedBox(height: 20,),
                Center(
                  child: Image.asset(
                    'assets/images/leaf_ic.png',
                    // Ensure the image is in pubspec.yaml
                    height: 100,
                  ),
                ),
                const SizedBox(height: 30),

                BuildTextField(
                  controller: usernameController,
                  title: "USER NAME",
                  loginController: loginController,
                ),
                const SizedBox(height: 12),

                BuildTextField(
                  controller: oldPasswordController,
                  title: "OLD PASSWORD",
                  loginController: loginController,
                  obscurePassword: true,
                ),
                const SizedBox(height: 12),
                BuildTextField(
                  controller: newPasswordController,
                  title: "NEW PASSWORD",
                  loginController: loginController,
                  obscurePassword: true,
                ),
                const SizedBox(height: 12),
                BuildTextField(
                  controller: confirmPasswordController,
                  title: "CONFIRM PASSWORD",
                  loginController: loginController,
                  obscurePassword: true,
                ),
                const SizedBox(height: 20,),
                CustomButton(bc_color: AppColors.lightOrange,
                    title: "Sign Up",
                    ToNavigate: DashboardC2C())


              ],
            ),
          ),
        ),
      ),
    );
  }


}
