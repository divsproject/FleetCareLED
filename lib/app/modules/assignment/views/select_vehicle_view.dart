import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';

import '../controllers/assignment_controller.dart';

class SelectVehicleView extends StatelessWidget {
  const SelectVehicleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: "Select Vehicle",
            actions: [
              IconButton(
                icon: Icon(Icons.edit_outlined,
                    color: Colors.white, size: 24.spMin),
                onPressed: () {},
              )
            ],
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // 🔍 Search bar
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
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
                        Column(
                          children: [
                            _buildSectionHeaderBox("Suggested (1)"),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.r),
                                    bottomRight: Radius.circular(12.r)),
                              ),
                              child: _vehicleTile(
                                vehicleNo: "305", // Hardcoded per plan
                                subtitle: "Last Selected",
                                controller: controller,
                                isFirst: true,
                                isLast: true,
                              ),
                            ),
                          ],
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
                                  isLast: index ==
                                      controller.otherVehicles.length - 1,
                                  showDivider: index !=
                                      controller.otherVehicles.length - 1,
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.h), // Spacing for bottom button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: // DONE button
              Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
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
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primary
                  : Colors.black, // Highlight if selected
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 13.5),
                )
              : null,
          trailing: isSelected
              ? Icon(Icons.check_box_outlined,
                  color: AppColors.primary, size: 22.spMin) // Checkbox style
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
