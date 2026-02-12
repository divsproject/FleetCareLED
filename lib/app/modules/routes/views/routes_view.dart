import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';

class RoutesView extends StatelessWidget {
  const RoutesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: "Routes",
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14.spMin),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 14.spMin),
            tabs: const [
              Tab(text: "Past"),
              Tab(text: "Today"),
              Tab(text: "Future"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _EmptyRoutes(
              title: "No Past Routes",
              subtitle: "No routes found in your past history",
            ),
            _EmptyRoutes(
              title: "No Routes for Today",
              subtitle: "There are no routes scheduled for today",
            ),
            _EmptyRoutes(
              title: "No Future Routes",
              subtitle: "No routes scheduled for future",
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyRoutes extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EmptyRoutes({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.lightBlueBg,
            child: Icon(Icons.alt_route, size: 36.sp, color: AppColors.primary),
          ),
          SizedBox(height: 16.h),
          CustomText(
            title,
            fontWeight: FontWeight.w600,
            fontSize: 16.spMin,
          ),
          SizedBox(height: 6.h),
          CustomText(
            subtitle,
            color: AppColors.textSecondary,
            fontSize: 12.spMin,
          ),
        ],
      ),
    );
  }
}
