// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mapleleaf/utils/app_colors.dart';
// import 'package:mapleleaf/view/Dealers/custom_button1.dart';
// import 'package:mapleleaf/view/Dealers/lead_sign_up.dart';
// import 'package:mapleleaf/view/Dealers/sign_up_controller.dart';
// import 'package:mapleleaf/view/auth/change_password_view.dart';
//
// import 'custom_textfield.dart'; // Make sure this defines BuildTextField
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final LoginController loginController = Get.put(LoginController());
//
//   bool rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E1E),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Image.asset(
//                     'assets/images/leaf_ic.png',
//                     height: 100,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 BuildTextField(
//                   controller: usernameController,
//                   title: "USER NAME",
//                   loginController: loginController,
//                 ),
//                 const SizedBox(height: 16),
//                 BuildTextField(
//                   controller: passwordController,
//                   title: "PASSWORD",
//                   loginController: loginController,
//                   obscurePassword: true,
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => setState(() => rememberMe = !rememberMe),
//                       child: Icon(
//                         rememberMe
//                             ? Icons.radio_button_checked
//                             : Icons.radio_button_off,
//                         color: AppColors.lightOrange,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'Remember Me',
//                       style: TextStyle(
//                         color: AppColors.whiteColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: const [
//                     Icon(Icons.vpn_key_rounded, color: AppColors.lightOrange),
//                     SizedBox(width: 8),
//                     Text(
//                       'Change Password?',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: const [
//                     Icon(Icons.lock_outline, color: AppColors.lightOrange),
//                     SizedBox(width: 8),
//                     Text(
//                       'Forgot Password',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: media.height * 0.04),
//                 CustomButton(
//                   bc_color: AppColors.lightOrange,
//                   title: "Sign In",
//                   ToNavigate:  LeadSignUp(),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Maple Fauj',
//                   style: TextStyle(color: AppColors.lightOrange, fontSize: 16),
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   'Version : 1.0.101',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
