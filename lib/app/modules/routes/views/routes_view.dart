import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';

class RoutesView extends StatelessWidget {
  const RoutesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const CustomText(
            "Routes",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            tabs: [
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
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.lightBlueBg,
            child: Icon(Icons.alt_route, size: 36, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          CustomText(
            title,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6),
          CustomText(
            subtitle,
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
