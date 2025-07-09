import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapleleaf/model/login_model.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_images.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_filter.dart';
import 'package:mapleleaf/utils/custom%20widgets/floatingaction_button.dart';
import 'package:mapleleaf/view/individual%20sites/IS_form.dart';
import '../../controller/IS/is_controller.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import 'areawise_view.dart';
import 'citiywise_view.dart';
class IndividualSites extends StatefulWidget {
  const IndividualSites({super.key});
  @override
  State<IndividualSites> createState() => _IndividualSitesState();
}
class _IndividualSitesState extends State<IndividualSites> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final RxInt selectedIndex = 0.obs;
  PlanController planController=Get.put(PlanController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: Colors.white, // Make the scaffold transparent
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
              CustomAppbar(title: 'individual sites', timeLocationIsVisible: true,widget: InkWell(onTap: (){},child: SvgPicture.asset(AppImages.filterIcon)),),
              const SizedBox(height: 20),
              // TabBar with animated slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,),
                child: Container(
                  height: 45,
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
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                            fontSize: MediaQuery.of(context).size.width * 0.036,
                          ),
                          tabs: const [
                            Tab(text: 'CITY WISE'),
                            Tab(text: 'AREA WISE'),
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
              // tabBarView
              // - Content Area
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 2,right: 2),
                  child: TabBarView(
                    controller: _tabController,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()
                    ),
                    children: [
                      CityWiseView(),
                      AreaWiseView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(onPressed: (){
        Get.off(IsForm());
      }),

    );
  }
}