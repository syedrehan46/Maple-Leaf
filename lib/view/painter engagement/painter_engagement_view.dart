import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import '../../utils/app_fonts.dart';
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
    final media=MediaQuery.of(context).size;
    // Calculate the exact position based on animation value for smooth tracking during slide
    final animationValue = _tabController.animation?.value ?? 0.0;

    return Scaffold(
      backgroundColor: Colors.white, // Base background color
      body: Stack(
        children: [
          // 🔽 Background Image
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

          // 🔼 Foreground Content
          Column(
            children: [
              CustomAppbar(title: 'PAINTER ENGAGEMENT'),
              const SizedBox(height: 20),

              // TabBar - Custom Styled with fixed text display issue
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
                          // Adding padding to ensure text fits
                          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                          // Ensure tabs have enough space
                          tabAlignment: TabAlignment.fill,
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
                  children: [
                    // Engaged Painters Tab
                    EngagedPainter(),
                    // Unengaged Painters Tab
                    UnengagedPainter(),
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