import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup_view.dart';
import 'package:mapleleaf/view/individual%20sites/individual_sites_view.dart';
import 'package:mapleleaf/view/jobs/jobs_view.dart';
import 'package:mapleleaf/view/lead%20management/lead_management_view.dart';
import 'package:mapleleaf/view/new%20painter%20induction/new_painter_induction_view.dart';
import 'package:mapleleaf/view/painter%20engagement/painter_engagement_view.dart';
import 'package:mapleleaf/view/sab%20contractor%20profile/sab_contractor_profile_view.dart';
import '../../utils/app_colors.dart';

class UleDashboardView extends StatefulWidget {
  const UleDashboardView({super.key});

  @override
  State<UleDashboardView> createState() => _UleDashboardViewState();
}

class _UleDashboardViewState extends State<UleDashboardView> {
  final controller = Get.put(AuthController());

  final List<_MenuItem> menuItems = [
    _MenuItem("IS", "assets/images/ule_group.png", () => Get.to(IndividualSites())),
    _MenuItem("IM", "assets/images/ic_ima.png", () => Get.to(IndividualMeetupView())),
    _MenuItem("NPI", "assets/images/ic_npi.png", () => Get.to(NewPainterInductionView())),
    _MenuItem("LM", "assets/images/ic_lm.png", () => Get.to(LeadManagementView())),
    _MenuItem("PE", "assets/images/ic_pe.png", () => Get.to(PainterEngagementView()), badgeCount: 1),
    _MenuItem("SCP", "assets/images/ic_scp.png", () => Get.to(SabContractorProfileView()), badgeCount: 1),
    _MenuItem("JOBS", "assets/images/ic_ima.png", () => Get.to(JobsView()), badgeCount: 0),
    // _MenuItem("CC", "assets/images/ic_cc.png", () {}),
    // _MenuItem("SA", "assets/images/ic_sa.png", () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final String employeeName = controller.employeeName;

    return Scaffold(
      body: Stack(
        children: [
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
          Column(
            children: [
              _buildHeader(employeeName),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our Menu",
                    style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GridView.builder(
                    itemCount: menuItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 25.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return _buildAvatar(item);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String employeeName) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_app.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const AssetImage('assets/images/ic_profile.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, Welcome 🎉", style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp)),
                    Text(employeeName, style: TextStyle(color: AppColors.whiteColor, fontSize: 17.sp)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Image.asset(
                "assets/images/ic_notification.png",
                height: 25.h,
                width: 25.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(_MenuItem item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: item.onTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xfff6f4f4),
                  border: Border.all(color: Colors.grey.shade300, width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Image.asset(
                    item.imagePath,
                    height: 40.r,
                    width: 40.r,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (item.badgeCount != null)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    height: 20.r,
                    width: 20.r,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${item.badgeCount}',
                        style: AppFonts.styleHarmoniaRegular12W400(AppColors.whiteColor).copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          item.label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            color:Color(0xff1A1A1A),
          ),
        )

      ],
    );
  }
}

class _MenuItem {
  final String label;
  final String imagePath;
  final VoidCallback onTap;
  final int? badgeCount;

  _MenuItem(this.label, this.imagePath, this.onTap, {this.badgeCount});
}
