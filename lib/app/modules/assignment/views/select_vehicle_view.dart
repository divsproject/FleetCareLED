import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assignment_controller.dart';

class SelectVehicleView extends StatelessWidget {
  const SelectVehicleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Vehicle"),
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
          body: Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Suggested
              _sectionTitle("Suggested (1)"),

              // Assuming keeping "305" as hardcoded suggested for now matching original
              _vehicleTile(
                vehicleNo: "305",
                subtitle: "Last Selected",
                controller: controller,
              ),

              _sectionTitle(
                  "Other Vehicles (\${controller.otherVehicles.length})"),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.otherVehicles.length,
                  itemBuilder: (context, index) {
                    return _vehicleTile(
                      vehicleNo: controller.otherVehicles[index],
                      controller: controller,
                    );
                  },
                ),
              ),

              // DONE button
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Done",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Section title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  // 🔹 Vehicle tile
  Widget _vehicleTile({
    required String vehicleNo,
    required AssignmentController controller,
    String? subtitle,
  }) {
    // Use Obx or GetBuilder logic. Since we are in GetBuilder, controller state is available.
    // However, selectedVehicle is an RxString, so we can use it directly if we want reactivity on just this tile,
    // or rely on GetBuilder update. The controller uses update(), so standard access is fine.

    final bool isSelected = controller.selectedVehicle.value == vehicleNo;

    return ListTile(
      title: Text("Vehicle $vehicleNo"),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      onTap: () {
        controller.setSelectedVehicle(vehicleNo);
      },
    );
  }
}
