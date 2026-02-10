import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Added import
import '../../../data/models/duty_status.dart';
import '../controllers/home_controller.dart';
import 'home_drawer.dart';
import 'widgets/select_note_widget.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // USER + VEHICLE
            Padding(
              padding: EdgeInsets.all(16.w), // Responsive padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    // Navigate to Profile tab (Index 3) using DashboardController
                    onTap: () {
                      final dashboardController =
                          Get.find<DashboardController>();
                      dashboardController.changeTab(3);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person, size: 18.sp), // Responsive icon
                        SizedBox(width: 6.w), // Responsive spacing
                        Obx(() => Text(
                              controller.currentDriver.value?.name ?? "User",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp), // Responsive font
                            )),
                      ],
                    ),
                  ),

                  // 🚚 VEHICLE CLICK
                  InkWell(
                    onTap: () => _openChangeEquipment(context, controller),
                    child: Row(
                      children: [
                        Icon(Icons.local_shipping,
                            size: 20.sp), // Responsive icon
                        SizedBox(width: 4.w), // Responsive spacing
                        Obx(() => Text(controller.vehicleNumber.value,
                            style:
                                TextStyle(fontSize: 16.sp))), // Responsive font
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h), // Responsive spacing

            // ⏱ TIMER
            SizedBox(
              height: 200.h, // Responsive height
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180.w, // Responsive width
                    height: 180.w, // Responsive height (square)
                    child: CircularProgressIndicator(
                      value: 0.75,
                      strokeWidth: 10.w, // Responsive stroke
                      color: Colors.grey.shade700,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "14:00",
                        style: TextStyle(
                          fontSize: 32.sp, // Responsive font
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("REMAINING",
                          style: TextStyle(fontSize: 12.sp)), // Responsive font
                      SizedBox(height: 6.h), // Responsive spacing

                      // Status Chip using Obx
                      Obx(
                        () => InkWell(
                          onTap: () => _openChangeStatus(context, controller),
                          child: Chip(
                            label: Text(
                              controller.currentStatus.value.name.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp), // Responsive font
                            ),
                            backgroundColor: controller.getStatusColor(
                              controller.currentStatus.value,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ⭕ CIRCLES
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.all(24.w), // Responsive padding
              mainAxisSpacing: 20.h, // Responsive spacing
              crossAxisSpacing: 20.w, // Responsive spacing
              children: const [
                _CircleInfo("8:00", "BREAK", Colors.amber),
                _CircleInfo("11:00", "DRIVING", Colors.green),
                _CircleInfo("14:00", "SHIFT", Colors.black),
                _CircleInfo("70:00", "CYCLE", Colors.blue),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // 🔽 CHANGE EQUIPMENT MODAL
  void _openChangeEquipment(BuildContext context, HomeController controller) {
    controller.vehicleController.text = controller.vehicleNumber.value;
    controller.trailerController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r)), // Responsive radius
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16.w,
            20.h,
            16.w,
            MediaQuery.of(context).viewInsets.bottom + 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Change Equipment",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold), // Responsive font
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.vehicleController,
                decoration: const InputDecoration(labelText: "Vehicle"),
                style: TextStyle(fontSize: 16.sp), // Responsive font
              ),
              TextField(
                controller: controller.trailerController,
                decoration: const InputDecoration(labelText: "Trailer"),
                style: TextStyle(fontSize: 16.sp), // Responsive font
              ),
              TextButton(
                onPressed: controller.addTrailer,
                child: Text("Add Trailer",
                    style: TextStyle(fontSize: 14.sp)), // Responsive font
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 48.h, // Responsive height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: controller.updateVehicle,
                  child: Text("Save",
                      style: TextStyle(fontSize: 16.sp)), // Responsive font
                ),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Cancel",
                    style: TextStyle(fontSize: 14.sp)), // Responsive font
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔽 OPEN CHANGE STATUS MODAL
  void _openChangeStatus(BuildContext context, HomeController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r)), // Responsive radius
      ),
      builder: (_) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w), // Responsive padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Change Status",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold), // Responsive font
                ),
                SizedBox(height: 16.h),
                // STATUS GRID
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 10.w, // Responsive spacing
                  mainAxisSpacing: 10.h, // Responsive spacing
                  padding: EdgeInsets.zero,
                  children: [
                    _statusTile(
                      "OFF",
                      "OFF DUTY",
                      Colors.red,
                      DutyStatus.offDuty,
                      controller,
                    ),
                    _statusTile(
                      "SB",
                      "SLEEPER",
                      Colors.blue,
                      DutyStatus.sleeper,
                      controller,
                    ),
                    _statusTile(
                      "ON",
                      "ON DUTY",
                      Colors.green,
                      DutyStatus.onDuty,
                      controller,
                    ),
                    _statusTile(
                      "D",
                      "DRIVING",
                      Colors.orange,
                      DutyStatus.driving,
                      controller,
                    ),
                    _statusTile(
                      "Y",
                      "YARD",
                      Colors.grey,
                      DutyStatus.yard,
                      controller,
                    ),
                    _statusTile(
                      "P",
                      "PERSONAL",
                      Colors.purple,
                      DutyStatus.personal,
                      controller,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // ADD NOTE
                Obx(
                  () => ListTile(
                    title: Text("Add Note",
                        style: TextStyle(fontSize: 16.sp)), // Responsive font
                    subtitle: Text(controller.selectedNote.value,
                        style: TextStyle(fontSize: 14.sp)), // Responsive font
                    trailing: Icon(Icons.chevron_right,
                        size: 24.sp), // Responsive icon
                    onTap: () async {
                      // Navigate to note selection widget
                      final note = await Get.to(() => const SelectNoteWidget());
                      if (note != null) controller.updateNote(note);
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h, // Responsive height
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text("Update",
                        style: TextStyle(fontSize: 16.sp)), // Responsive font
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statusTile(
    String short,
    String label,
    Color color,
    DutyStatus status,
    HomeController controller,
  ) {
    return Obx(() {
      final bool isSelected = controller.currentStatus.value == status;
      return InkWell(
        onTap: () => controller.updateStatus(status),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.15) : Colors.white,
            borderRadius: BorderRadius.circular(14.r), // Responsive radius
            border: Border.all(
              color: isSelected ? color : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: isSelected ? color : Colors.grey.shade300,
                radius: 20.r, // Responsive radius
                child: Text(
                  short,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp, // Responsive font
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.sp, // Responsive font
                  fontWeight: FontWeight.w600,
                  color: isSelected ? color : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _CircleInfo extends StatelessWidget {
  final String time;
  final String label;
  final Color color;

  const _CircleInfo(this.time, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 6.w), // Responsive border width
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold), // Responsive font
            ),
            Text(label, style: TextStyle(fontSize: 12.sp)), // Responsive font
          ],
        ),
      ),
    );
  }
}
