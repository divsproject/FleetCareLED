import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assignment_controller.dart';
import '../../../routes/app_routes.dart';

class EnterShippingView extends StatelessWidget {
  const EnterShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF4F9FD),
          appBar: AppBar(
            backgroundColor: const Color(0xFF2AA6DF),
            elevation: 0,
            title: const Text("Shipping ID"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // 🔹 Input
                TextField(
                  decoration: InputDecoration(
                    labelText: "Shipping ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // 🔹 Suggestion
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Suggestions\nHello",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ),

                const Spacer(),

                // 🔹 Save Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2AA6DF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      // Original code routed to Home, but here we likely want to go back to Assignment or Select Shipping
                      Get.back();
                    },
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
