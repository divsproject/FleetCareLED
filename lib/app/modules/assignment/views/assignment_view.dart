import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/assignment_controller.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      init: AssignmentController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFEFF7FC),
          appBar: AppBar(
            backgroundColor: const Color(0xFF2AA6DF),
            elevation: 0,
            title: const Text("Assignments"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _AssignmentCard(
                      icon: Icons.local_shipping,
                      title: "Vehicle",
                      subtitle: "Select Vehicle",
                      onTap: controller.navigateToSelectVehicle,
                    ),
                    const SizedBox(height: 20),
                    _AssignmentCard(
                      icon: Icons.view_list,
                      title: "Trailer(s)",
                      subtitle:
                          "Add a Ship-related Trailer(s) or No Trailer ID",
                      big: true,
                      onTap: controller.navigateToEnterTrailer,
                    ),
                    const SizedBox(height: 20),
                    _AssignmentCard(
                      icon: Icons.inventory_2,
                      title: "Shipping IDs",
                      subtitle: "Add a Shipping ID",
                      onTap: controller.navigateToAddShippingId,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
                onPressed: controller.completeAssignment,
                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/* ---------------- CARD WIDGET ---------------- */
// Keeping internal widget as per original file structure preference
class _AssignmentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool big;
  final VoidCallback? onTap;

  const _AssignmentCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.big = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: big ? 28 : 22, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFEAF6FF),
              child: Icon(icon, color: const Color(0xFF2AA6DF), size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
