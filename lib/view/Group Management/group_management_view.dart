import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

import '../../utils/custom widgets/custom_appbar.dart';

class GroupManagementView extends StatefulWidget {
  const GroupManagementView({super.key});
  @override
  State<GroupManagementView> createState() => _GroupManagementViewState();
}

class _GroupManagementViewState extends State<GroupManagementView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RxInt selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();


    // Add listener to force rebuild on animation changes for smooth transitions
    _tabController.animation!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final animationValue = _tabController.animation?.value ?? 0.0;

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
              CustomAppbar(title: 'GROUP MANAGEMENT', timeLocationIsVisible: true),
              const SizedBox(height: 20),

              // TabBar with animated slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: media.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.redColor, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Stack(
                      children: [
                        // Animated indicator that follows the tab selection
                        AnimatedBuilder(
                          animation: _tabController.animation!,
                          builder: (context, _) {
                            return Positioned(
                              left: MediaQuery.of(context).size.width * 0.5 * animationValue - 5,
                              right: MediaQuery.of(context).size.width * 0.5 * (1 - animationValue) - 5,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            );
                          },
                        ),

                        // The actual TabBar with transparent indicator
                        TabBar(
                          controller: _tabController,
                          indicator: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey.shade600,

                          // Use MediaQuery for responsive font size
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                            fontSize: MediaQuery.of(context).size.width * 0.036,
                          ),

                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),

                          tabs: const [
                            Tab(text: 'ENGAGED PAINTERS'),
                            Tab(text: 'UNENGAGED PAINTERS'),
                          ],
                          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                          tabAlignment: TabAlignment.fill,

                          // Optional: Make tab transitions smoother
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // TabBarView - Content Area
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()
                  ),
                  children: [
                    // Engaged Painters Tab Content
                    // Replace with your actual content widget or builder
                    Center(
                      child: Text(
                        '',

                      ),
                    ),

                    // Unengaged Painters Tab Content
                    // Replace with your actual content widget or builder
                    Center(
                      child: Text(
                        '',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}