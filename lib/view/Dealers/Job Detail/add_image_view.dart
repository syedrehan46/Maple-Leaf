// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:mapleleaf/utils/app_colors.dart';
// import 'package:mapleleaf/utils/app_fonts.dart';
// import 'package:mapleleaf/utils/custom%20widgets/Custom_Toaste.dart';
// import 'package:mapleleaf/view/Dealers/Job%20Detail/job_view.dart';
// import 'package:mapleleaf/view/Dealers/custom_button1.dart';
//
// class AddImageView extends StatefulWidget {
//   const AddImageView({super.key});
//
//   @override
//   State<AddImageView> createState() => _AddImageViewState();
// }
//
// class _AddImageViewState extends State<AddImageView> {
//   File? _selectedImage;
//
//   Future<void> _pickImage() async {
//     final status = await Permission.photos.request();
//
//     if (status.isGranted) {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//       if (pickedFile != null) {
//         setState(() {
//           _selectedImage = File(pickedFile.path);
//         });
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Permission denied. Please allow media access from settings.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.cover)),
//           Column(
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//               Center(
//                 child: Text(
//                   "START YOUR DAY",
//                   style: AppFonts.styleHarmoniaBold31W600(Colors.black).copyWith(fontSize: 24),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.08),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Column(
//                   children: [
//                     Image.asset("assets/images/ic_camera.png", height: 50, width: 50),
//                     const SizedBox(height: 8),
//                     Text(
//                       "Capture Image",
//                       style: AppFonts.styleHarmoniaBold16W600(Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               if (_selectedImage != null) ...[ // Display selected image if available
//                 const SizedBox(height: 20),
//                 Image.file(_selectedImage!, height: 120),
//               ],
//               SizedBox(height: MediaQuery.of(context).size.height * 0.08),
//               CustomButton(
//                 bc_color: AppColors.lightOrange,
//                 title: "SUBMIT",
//                 ToNavigate: () {
//                   if (_selectedImage == null) {
//                     CustomToastText("Image is Mandatory"); // Display toast if image is not selected
//                   } else {
//                     Get.to(() => JobView()); // Navigate if image is selected
//                   }
//                 },
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//               CustomButton(
//                 bc_color: AppColors.collectedColor,
//                 title: "NOT NOW",
//                 ToNavigate: () {
//                   Get.to(() => JobView()); // Navigate to JobView
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
