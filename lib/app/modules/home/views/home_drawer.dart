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
    return Drawer(
      width: 280.w, // Responsive drawer width
      child: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w, right: 12.w), // Responsive padding
                  children: [
                    _tile(Icons.person_add, "Co-Driver Login", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.CO_DRIVER_LOGIN);
                    }),

                    // Conditional Switch Driver Option
                    Obx(
                      () => controller.isCoDriverLoggedIn.value
                          ? _tile(Icons.swap_horiz, "Switch Driver", () {
                              Get.back(); // Close drawer
                              Get.toNamed(AppRoutes.DRIVER_SWITCHING);
                            })
                          : const SizedBox.shrink(),
                    ),

                    Divider(color: Colors.white24, height: 1.h),
                    _tile(Icons.timer, "HoS", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.HOS);
                    }),
                    _tile(Icons.assignment, "DVIR", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.DVIR);
                    }),
                    _tile(Icons.alt_route, "Routes", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.ROUTES);
                    }),
                    _tile(Icons.local_gas_station, "Fueling", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.FUELING);
                    }),
                    _tile(Icons.folder, "Document", () {
                      Get.back(); // Close drawer
                    }),
                    _tile(Icons.local_shipping, "Vehicle", () {
                      Get.back(); // Close drawer
                    }),
                    // Removed static 'Driving' tile as it's replaced/handled by Switch Driver or HoS context usually
                    // but keeping others for now.
                    _tile(Icons.settings, "Settings", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.SETTINGS);
                    }),
                    _tile(Icons.local_police, "DOT Inspection Mode", () {
                      Get.back(); // Close drawer
                      Get.toNamed(AppRoutes.DOT_INSPECTION);
                    }),

                    // Logout Button at the bottom
                    Divider(color: Colors.white24, height: 1.h),
                    _tile(Icons.logout, "Logout", () {
                      Get.back(); // Close drawer
                      controller.logout();
                    }, color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(
    IconData icon,
    String label,
    VoidCallback onTap, {
    Color color = Colors.white,
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24.spMin),
      title: Text(
        label,
        style: TextStyle(color: color, fontSize: 16.spMin),
      ),
      trailing:
          Icon(Icons.chevron_right, color: Colors.white54, size: 24.spMin),
      onTap: onTap,
    );
  }
}
