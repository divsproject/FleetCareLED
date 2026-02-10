import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/assignment_controller.dart';

class SelectVehicleView extends StatelessWidget {
  const SelectVehicleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: CustomText(
              "Select Vehicle",
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon:
                    Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
                onPressed: () {},
              )
            ],
          ),
          body: Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomTextField(
                  hintText: "Search here...",
                  suffixIcon:
                      Icon(Icons.search, color: Colors.grey, size: 24.sp),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    // Suggested Section
                    _buildSectionHeader("Suggested (1)"),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r)),
                      ),
                      // Assuming "305" is the suggested one
                      child: _vehicleTile(
                        vehicleNo: "305", // Hardcoded per plan
                        subtitle: "Last Selected",
                        controller: controller,
                        isFirst: true,
                        isLast:
                            false, // Connected to bottom section visually in design
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Other Vehicles Section
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          _buildSectionHeaderBox(
                              "Other Vehicles (${controller.otherVehicles.length})"),
                          ...controller.otherVehicles
                              .asMap()
                              .entries
                              .map((entry) {
                            final index = entry.key;
                            final vehicle = entry.value;
                            return _vehicleTile(
                              vehicleNo: vehicle,
                              controller: controller,
                              isFirst: false,
                              isLast:
                                  index == controller.otherVehicles.length - 1,
                              showDivider:
                                  index != controller.otherVehicles.length - 1,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 80.h), // Spacing for bottom button
                  ],
                ),
              ),

              // DONE button
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomButton(
                  label: "Done",
                  height: 50.h,
                  width: double.infinity,
                  borderRadius: 30.r, // Rounded full
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Header with blue background like in design
  Widget _buildSectionHeaderBox(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF8FE), // Light blue background
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Standalone header text
  Widget _buildSectionHeader(String title) {
    // Re-implementing "Suggested" block to match the "Other Vehicles" style
    // The design shows "Suggested" block as a card with header.
    // So I should wrap the Suggested item in a similar structure.
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildSectionHeaderBox(title),
          // The tile will be added by the parent
        ],
      ),
    );
  }

  // 🔹 Vehicle tile
  Widget _vehicleTile({
    required String vehicleNo,
    required AssignmentController controller,
    String? subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool showDivider = false,
  }) {
    // Obx for reactivity if needed, but GetBuilder refreshes whole view on update()
    final bool isSelected = controller.selectedVehicle.value == vehicleNo;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          title: Text(
            vehicleNo,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primary
                  : Colors.black, // Highlight if selected
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 13.5.sp),
                )
              : null,
          trailing: isSelected
              ? Icon(Icons.check_box_outlined,
                  color: AppColors.primary, size: 22.sp) // Checkbox style
              : null,
          onTap: () {
            controller.setSelectedVehicle(vehicleNo);
          },
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade200,
            indent: 16.w,
            endIndent: 16.w,
          ),
      ],
    );
  }
}
