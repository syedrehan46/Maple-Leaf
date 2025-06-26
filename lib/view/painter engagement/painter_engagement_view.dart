import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import '../../controller/PE/Painter_Engaged_Controller.dart';
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
  PainterEngagedController painterEngagedController=Get.put(PainterEngagedController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen to tab changes to update selectedIndex
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        selectedIndex.value = _tabController.index;
      }
    });

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
    final media = MediaQuery.of(context).size;
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

              // TabBar - Custom Styled with proper color management
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
                              left: (media.width - 20) * 0.5 * animationValue,
                              right: (media.width - 20) * 0.5 * (1 - animationValue),
                              top: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            );
                          },
                        ),

                        // The actual TabBar with proper color settings
                        TabBar(
                          controller: _tabController,
                          indicator: const BoxDecoration(
                            color: Colors.transparent, // Keep transparent since we have custom indicator
                          ),
                          dividerColor: Colors.transparent,

                          // 🔥 FIXED: Proper color management
                          labelColor: Colors.white, // Selected tab text color (white on primary background)
                          unselectedLabelColor: AppColors.blackColor, // Unselected tab text color

                          // 🔥 FIXED: Remove color override in styles
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: media.width * 0.036,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w500, // Slightly less bold for unselected
                            fontSize: media.width * 0.036,
                          ),

                          tabs: const [
                            Tab(text: 'ENGAGED PAINTERS'),
                            Tab(text: 'UNENGAGED PAINTERS'),
                          ],
                          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
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
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()
                  ),
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