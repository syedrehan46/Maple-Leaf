import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mapleleaf/controller/auth_controller.dart';
import 'package:mapleleaf/main.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/auth/change_password_view.dart';
import 'package:mapleleaf/view/auth/forgot_password_view.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('saved_username');
    final savedPassword = prefs.getString('saved_password');
    if (savedUsername != null && savedPassword != null) {
      setState(() {
        usernameController.text = savedUsername;
        passwordController.text = savedPassword;
        _rememberMe = true;
      });
    }
  }

  Future<void> _saveCredentials() async {
    if (_rememberMe) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_username', usernameController.text);
      await prefs.setString('saved_password', passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AutofillGroup(
        child: Form(
          key: _formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                const Positioned.fill(
                  child: Image(
                    image: AssetImage("assets/images/menu_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(Icons.arrow_back_ios, size: 16.r),
                                ),
                                Text(
                                  "Create Account",
                                  style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              "Sign In to Your Account",
                              style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),
                            ),
                            SizedBox(height: 100.h),

                            // Username field with autofill
                            UiHelper.customTextField(
                              controller: usernameController,
                              labelText: "Username",
                              autofillHints: const [AutofillHints.username],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),

                            // Password field with autofill
                            UiHelper.customPassTextField(
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              isPasswordVisible: _isPasswordVisible,
                              onPress: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              autofillHints: const [AutofillHints.password],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10.h),

                            // Remember Me checkbox
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rememberMe = !_rememberMe;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primaryColor, width: 1.5),
                                    ),
                                    child: _rememberMe
                                        ? Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                        : null,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Remember Me',
                                    style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),

                            // Sign In button
                            UiHelper.customButtonFill(
                              color: AppColors.primaryColor,
                              fontColor: Colors.white,
                              btnText: "Sign in".toUpperCase(),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (usernameController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    _saveCredentials(); // Save only if RememberMe is selected
                                    Get.find<AuthController>().apiLogin(
                                      userName: usernameController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                } else {
                                  print("Form validation failed.");
                                }
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => const ForgetPasswordView());
                                      },
                                      child: Text(
                                        "Forgot the Password?",
                                        style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => const ChangePasswordView());
                                      },
                                      child: Text(
                                        "Change Password?",
                                        style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Version : $appVersion",
                              style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
