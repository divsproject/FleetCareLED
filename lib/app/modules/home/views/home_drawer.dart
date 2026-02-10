import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeDrawer extends StatelessWidget {
  final HomeController controller;

  const HomeDrawer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w, // Responsive drawer width
      color: const Color(0xFF1F1F1F),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(12.w), // Responsive padding
                children: [
                  _tile(Icons.person_add, "Co-Driver Login", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.CO_DRIVER_LOGIN);
                  }),

                  // Conditional Switch Driver Option
                  Obx(() => controller.isCoDriverLoggedIn.value
                      ? _tile(Icons.swap_horiz, "Switch Driver", () {
                          controller.closeQuickActions();
                          Get.toNamed(AppRoutes.DRIVER_SWITCHING);
                        })
                      : const SizedBox.shrink()),

                  Divider(color: Colors.white24, height: 1.h),
                  _tile(Icons.timer, "HoS", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.HOS);
                  }),
                  _tile(Icons.assignment, "DVIR", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.DVIR);
                  }),
                  _tile(Icons.alt_route, "Routes", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.ROUTES);
                  }),
                  _tile(Icons.local_gas_station, "Fueling", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.FUELING);
                  }),
                  _tile(Icons.folder, "Document", () {
                    controller.closeQuickActions();
                  }),
                  _tile(Icons.local_shipping, "Vehicle", () {
                    controller.closeQuickActions();
                  }),
                  // Removed static 'Driving' tile as it's replaced/handled by Switch Driver or HoS context usually
                  // but keeping others for now.
                  _tile(Icons.settings, "Settings", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.SETTINGS);
                  }),
                  _tile(Icons.local_police, "DOT Inspection Mode", () {
                    controller.closeQuickActions();
                    Get.toNamed(AppRoutes.DOT_INSPECTION);
                  }),
                ],
              ),
            ),

            // Logout Button at the bottom
            Divider(color: Colors.white24, height: 1.h),
            _tile(Icons.logout, "Logout", () {
              controller.closeQuickActions();
              controller.logout();
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24.sp),
      title:
          Text(label, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
      trailing: Icon(Icons.chevron_right, color: Colors.white54, size: 24.sp),
      onTap: onTap,
    );
  }
}
