import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'Engaged Painter/engaged_painter.dart';
import 'Unengaged Painter/unengaged_painter.dart';


class PainterEngagementView extends StatefulWidget {
  const PainterEngagementView({super.key});
  @override
  State<PainterEngagementView> createState() => _PainterEngagementViewState();
}

class _PainterEngagementViewState extends State<PainterEngagementView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RxInt selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Force rebuild on any animation value change to synchronize slider position with swipe
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
    // Calculate the exact position based on animation value for smooth tracking during slide
    final animationValue = _tabController.animation?.value ?? 0.0;
    final indicatorPosition = animationValue * (MediaQuery.of(context).size.width * 0.5 - 10);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    "PAINTER ENGAGEMENT",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TabBar - Custom Styled
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.redColor, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    children: [
                      // This indicator now moves exactly with the swipe animation
                      Positioned(
                        left: indicatorPosition,
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 20) * 0.5, // Half width minus padding
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),

                      // The actual TabBar with transparent indicator
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TabBar(
                          controller: _tabController,
                          indicator: const BoxDecoration(
                            // Making the indicator transparent since we're using our custom background
                            color: Colors.transparent,
                          ),
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey.shade600,
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                          tabs: const [
                            Tab(text: 'ENGAGED PAINTERS'),
                            Tab(text: 'UNENGAGED PAINTERS'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // TabBarView - Content Area
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:  [
                  // Engaged Painters Tab
                  EngagedPainter(),

                  // Unengaged Painters Tab
                  UnengagedPainter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}