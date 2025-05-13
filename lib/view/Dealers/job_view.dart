import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class JobView extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {'date': '11-05-2025', 'name': 'WAQAS'},
    {'date': '12-05-2025', 'name': 'WAQAS'},
    {'date': '12-05-2025', 'name': 'MUZAMMIL ASLAM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          appBar: AppBar(
            backgroundColor: AppColors.blackColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'JOBS',
              style: AppFonts.styleHarmoniaBold18W600(),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: AppColors.inverterReceivedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                          Get.to(() => JobDetail(job: job));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4091B4),
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
          ),
        ),
      ),
    );
  }
}

class JobDetail extends StatelessWidget {
  final Map<String, String> job;

  const JobDetail({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final jobName = job['name'] ?? 'N/A';
    final jobDate = job['date'] ?? 'N/A';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'JOBS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'My Scheduled Jobs',
              style: TextStyle(
                color: Colors.orange[700],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF3280A6),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('1', style: TextStyle(color: Colors.white)),
                  Text(jobDate, style: const TextStyle(color: Colors.white)),
                  Text(jobName, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: const Color(0xFF3280A6),
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
                  infoRowWithUnderline('Customer No', '03214343433'),
                  infoRowWithUnderline('City', 'LAHORE'),
                  infoRowWithUnderline('Via', 'HUNTING'),
                  infoRowWithUnderline('Created By', 'FOS'),
                  infoRowWithUnderline('Assigned To', 'WAQAS CHAUDHARY'),
                  infoRowWithUnderline('Lead Creation', '10-MAY-2025'),
                  infoRowWithUnderline('Planned Visit Date', jobDate),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // Width: 60, Height: 30
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    ),
                    child: Text(
                      'PROCESSED',
                      style: TextStyle(fontSize: 12), // Optional: smaller text
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              '$label :',
              style: AppFonts.styleHarmoniaBold16W600(Colors.white),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(color: Colors.white),
        ),
      ],
    );
  }
}
