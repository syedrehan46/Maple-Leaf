import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

import '../../model/dashboardp2pmodel.dart';

class DashboardC2C extends StatelessWidget {
  const DashboardC2C({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome: Waleed Ali',
                style: AppFonts.styleHarmoniaBold12W600(AppColors.whiteColor)
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
                width: media.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(28),
                    topLeft: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 50),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 25,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: dashboardItems.length,
                    itemBuilder: (context, index) {
                      return DashboardItem(
                        icon: dashboardItems[index].icon,
                        title: dashboardItems[index].title,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DashboardItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.lightOrange, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppColors.lightOrange,
            ),
            Text(
              title,
              style: AppFonts.styleHarmoniaBold12W600(AppColors.whiteColor).copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

final List<DashboardItemModel> dashboardItems = [
  DashboardItemModel(
    icon: Icons.home,
    title: 'Home',
    onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.person,
    title: 'Profile',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.settings,
    title: 'Settings',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.notifications,
    title: 'Notifications',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.message,
    title: 'Messages',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.history,
    title: 'History',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.favorite,
    title: 'Favorites',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.shopping_cart,
    title: 'Cart',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.book,
    title: 'Book',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.article,
    title: 'Articles',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.music_note,
    title: 'Music',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.video_library,
    title: 'Video',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.photo,
    title: 'Photo',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.file_copy,
    title: 'Files',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.calendar_today,
    title: 'Calendar',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.wallet,
    title: 'Wallet',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.location_on,
    title: 'Location',
      onTap: (){}
  ),
  DashboardItemModel(
    icon: Icons.help,
    title: 'Help',
      onTap: (){
      }
  ),
];