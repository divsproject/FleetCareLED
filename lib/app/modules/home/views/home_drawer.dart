import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeDrawer extends StatelessWidget {
  final HomeController controller;

  const HomeDrawer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: const Color(0xFF1F1F1F),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            _tile(Icons.person_add, "Co-Driver Login", () {
              controller.closeQuickActions();
              Get.toNamed(AppRoutes.CO_DRIVER_LOGIN);
            }),
            const Divider(color: Colors.white24),
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
            _tile(Icons.swap_horiz, "Driving", () {
              controller.closeQuickActions();
            }),
            _tile(Icons.settings, "Settings", () {
              controller.closeQuickActions();
            }),
          ],
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
      onTap: onTap,
    );
  }
}
