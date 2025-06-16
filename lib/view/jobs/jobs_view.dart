import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import '../Maple Lead/Dealers/Job Detail/general_customer_view.dart';

class JobsView extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {
      'date': '11-05-2025',
      'name': 'WAQAS',
      'customerNo': '03214343433',
      'via': 'HUNTING',
      'createdBy': 'FOS',
    },
    {
      'date': '12-05-2025',
      'name': 'WAQAS',
      'customerNo': '03212345678',
      'via': 'WALK-IN',
      'createdBy': 'ALI',
    },
    {
      'date': '12-05-2025',
      'name': 'MUZAMMIL ASLAM',
      'customerNo': '03111234567',
      'via': 'REFERRAL',
      'createdBy': 'AHMED',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'JOBS',
          style: AppFonts.styleHarmoniaBold18W600(),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/menu_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'My Scheduled Jobs',
                  style: AppFonts.styleHarmoniaBold16W600(Colors.deepOrange),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => GeneralCustomerView(
                          customerNo: job['customerNo'] ?? '',
                          jobName: job['name'] ?? '',
                          via: job['via'] ?? '',
                          createdby: job['createdBy'] ?? '',
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.blue0094D6Color.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: AppFonts.styleHarmoniaBold18W600(),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      job['date']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  job['name']!,
                                  style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'MONTHLY PLAN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
