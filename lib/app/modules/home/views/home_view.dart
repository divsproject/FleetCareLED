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
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          //add user and vehicle section here in colum
          return Column(
            children: [
              _buildUserAndVehicle(context, isLandscape),
              Expanded(
                child: Row(
                  children: [
                    // ⏱ TIMER (Left Side)
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: SingleChildScrollView(
                          child: _buildTimer(isLandscape),
                        ),
                      ),
                    ),

                    // Right Side (User Info + Grid)
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: SingleChildScrollView(
                          child: _buildStatusGrid(isLandscape),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        // PORTRAIT
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildUserAndVehicle(context, isLandscape),
                        SizedBox(height: 10.h),
                        SizedBox(child: _buildTimer(isLandscape)),
                      ],
                    ),
                    _buildStatusGrid(isLandscape),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildUserAndVehicle(BuildContext context, bool isLandscape) {
    // Prevent huge text in landscape by limiting scaling
    double fontSize(double size) => isLandscape ? size : size.spMin;

    return Padding(
      padding: EdgeInsets.only(
        top: isLandscape ? 4.h : 16.h,
        bottom: isLandscape ? 4.h : 16.h,
        left: isLandscape ? 8.w : 16.w,
        right: isLandscape ? 8.w : 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              final dashboardController = Get.find<DashboardController>();
              dashboardController.changeTab(3);
            },
            child: Row(
              children: [
                Icon(Icons.person, size: fontSize(18)),
                SizedBox(width: 6.w),
                Obx(() => Text(
                      controller.currentDriver.value?.name ?? "User",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: fontSize(16)),
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () => _openChangeEquipment(context, controller),
            child: Row(
              children: [
                Icon(Icons.local_shipping, size: fontSize(20)),
                SizedBox(width: 4.w),
                Obx(() => Text(controller.vehicleNumber.value,
                    style: TextStyle(fontSize: fontSize(16)))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer(bool isLandscape) {
    double fontSize(double size) => isLandscape ? size : size.spMin;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: isLandscape ? 130.h : 180.w,
              height: isLandscape ? 130.h : 180.w,
              child: CircularProgressIndicator(
                value: 0.75,
                strokeWidth: isLandscape ? 8 : 12.w,
                color: Colors.grey.shade800,
                backgroundColor: Colors.grey.shade200,
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "14:00",
                  style: TextStyle(
                    fontSize: fontSize(36),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "REMAINING",
                  style: TextStyle(
                    fontSize: fontSize(12),
                    color: Colors.grey.shade600,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(
          () => InkWell(
            onTap: () => _openChangeStatus(Get.context!, controller),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: controller.getStatusColor(
                  controller.currentStatus.value,
                ),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: controller
                        .getStatusColor(controller.currentStatus.value)
                        .withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                controller.currentStatus.value.name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusGrid(bool isLandscape) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: isLandscape
          ? 1.6
          : 1.0, // Increased height ratio to prevent clipping (1.6)
      padding: EdgeInsets.only(
        top: isLandscape ? 4.h : 24.h,
        bottom: isLandscape ? 4.h : 24.h,
        left: isLandscape ? 12.w : 24.w,
        right: isLandscape ? 12.w : 24.w,
      ),
      mainAxisSpacing: isLandscape ? 8.h : 20.h,
      crossAxisSpacing: isLandscape ? 16.w : 20.w,
      children: [
        _CircleInfo("8:00", "BREAK", Colors.amber, isLandscape: isLandscape),
        _CircleInfo("11:00", "DRIVING", Colors.green, isLandscape: isLandscape),
        _CircleInfo("14:00", "SHIFT", Colors.black, isLandscape: isLandscape),
        _CircleInfo("70:00", "CYCLE", Colors.blue, isLandscape: isLandscape),
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
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.bold), // Responsive font
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.vehicleController,
                decoration: const InputDecoration(labelText: "Vehicle"),
                style: TextStyle(fontSize: 16.spMin), // Responsive font
              ),
              TextField(
                controller: controller.trailerController,
                decoration: const InputDecoration(labelText: "Trailer"),
                style: TextStyle(fontSize: 16.spMin), // Responsive font
              ),
              TextButton(
                onPressed: controller.addTrailer,
                child: Text("Add Trailer",
                    style: TextStyle(fontSize: 14.spMin)), // Responsive font
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 48.h, // Responsive height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007BFF), // Updated to a blue color
                  ),
                  onPressed: controller.updateVehicle,
                  child: Text("Save",
                      style: TextStyle(fontSize: 16.spMin, color: Colors.white)), // Responsive font
                ),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Cancel",
                    style: TextStyle(fontSize: 14.spMin)), // Responsive font
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
            padding: EdgeInsets.only(
                top: 16.h,
                bottom: 16.h,
                left: 16.w,
                right: 16.w), // Responsive padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Change Status",
                  style: TextStyle(
                      fontSize: 18.spMin,
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
                        style:
                            TextStyle(fontSize: 16.spMin)), // Responsive font
                    subtitle: Text(controller.selectedNote.value,
                        style:
                            TextStyle(fontSize: 14.spMin)), // Responsive font
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007BFF), // Updated to a blue color
                    ),
                    onPressed: () => Get.back(),
                    child: Text("Update",
                        style:
                            TextStyle(fontSize: 16.spMin, color: Colors.white)), // Responsive font
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
                    fontSize: 14.spMin, // Responsive font
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.spMin, // Responsive font
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
  final bool isLandscape;

  const _CircleInfo(this.time, this.label, this.color,
      {this.isLandscape = false});

  @override
  Widget build(BuildContext context) {
    // Reduce font slightly more in landscape to ensure fit
    double fontSize(double size) => isLandscape ? size * 0.9 : size.spMin;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 6.w), // Responsive border width
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  time,
                  style: TextStyle(
                      fontSize: fontSize(20),
                      fontWeight: FontWeight.bold), // Responsive font
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(label,
                    style:
                        TextStyle(fontSize: fontSize(12))), // Responsive font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
