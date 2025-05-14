import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/general_customer_view.dart';

class JobView extends StatelessWidget {
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
    return SafeArea(
      child: Scaffold(
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
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black54,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: jobDetailForm(job),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.9),
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
                                    style: AppFonts.styleHarmoniaBold16W600(Colors.white),
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
      ),
    );
  }
}

Widget jobDetailForm(Map<String, String> job) {
  final jobName = job['name'] ?? 'N/A';
  final jobDate = job['date'] ?? 'N/A';
  final customerNo = job['customerNo'] ?? 'N/A';
  final via = job['via'] ?? 'N/A';
  final createdBy = job['createdBy'] ?? 'N/A';

  return Container(
    color: AppColors.whiteColor,
    width: 320,
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,

          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              jobName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        infoRowWithUnderline('Customer No', customerNo),
        infoRowWithUnderline('City', 'LAHORE'), // Hardcoded for now
        infoRowWithUnderline('Via', via),
        infoRowWithUnderline('Created By', createdBy),
        infoRowWithUnderline('Assigned To', 'WAQAS CHAUDHARY'), // Static value
        infoRowWithUnderline('Lead Creation', '10-MAY-2025'),   // Static value
        infoRowWithUnderline('Planned Visit Date', jobDate),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Get.to(() => GeneralCustomerView(
              customerNo: customerNo,
              jobName: jobName,
              via: via,
              createdby: createdBy,
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          ),
          child: Text(
            'PROCESSED',
            style: AppFonts.styleHarmoniaBold16W600(Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '$label :',
            style: AppFonts.styleHarmoniaBold14W600(Colors.black),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: AppFonts.styleHarmoniaBold14W600(Colors.black),
          ),
        ),
      ],
    ),
  );
}

Widget infoRowWithUnderline(String label, String value) {
  return Column(
    children: [
      infoRow(label, value),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Divider(color: AppColors.blackColor),
      ),
    ],
  );
}
