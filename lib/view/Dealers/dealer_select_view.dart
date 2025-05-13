// import 'package:flutter/material.dart';
//
// class DealerFormScreen extends StatefulWidget {
//   const DealerFormScreen({super.key});
//
//   @override
//   State<DealerFormScreen> createState() => _DealerFormScreenState();
// }
//
// class _DealerFormScreenState extends State<DealerFormScreen> {
//   final TextEditingController dealerNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController gstController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//
//   final List<String> cities = ['Delhi', 'Mumbai', 'Bangalore', 'Chennai'];
//   bool showCityPopup = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dealer Form')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildField(label: 'Dealer Name', controller: dealerNameController),
//             _buildField(label: 'Phone Number', controller: phoneController),
//             _buildField(label: 'Email ID', controller: emailController),
//             _buildField(label: 'Address', controller: addressController),
//             _buildField(label: 'GST Number', controller: gstController),
//             const SizedBox(height: 12),
//             const Text('City', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 6),
//             Stack(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showCityPopup = !showCityPopup;
//                     });
//                   },
//                   child: AbsorbPointer(
//                     child: TextField(
//                       controller: cityController,
//                       decoration: InputDecoration(
//                         hintText: 'Select a city',
//                         border: OutlineInputBorder(),
//                         suffixIcon: const Icon(Icons.arrow_drop_down),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (showCityPopup)
//                   Positioned(
//                     top: 60,
//                     left: 0,
//                     right: 0,
//                     child: Material(
//                       elevation: 2,
//                       borderRadius: BorderRadius.circular(4),
//                       child: ListView(
//                         shrinkWrap: true,
//                         children: cities.map((city) {
//                           return ListTile(
//                             title: Text(city),
//                             onTap: () {
//                               setState(() {
//                                 cityController.text = city;
//                                 showCityPopup = false;
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   )
//               ],
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Submit logic here
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildField({
//     required String label,
//     required TextEditingController controller,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 6),
//           TextField(
//             controller: controller,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
