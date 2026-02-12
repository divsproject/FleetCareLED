import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/dvir_controller.dart';

class CreateDvirView extends GetView<DvirController> {
  const CreateDvirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Create DVIR",
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Info
            _buildTextField("Vehicle", controller.vehicleController),
            SizedBox(height: 16.h),
            _buildTextField("VIN", controller.vinController),
            SizedBox(height: 16.h),
            _buildTextField("Location", controller.locationController),
            SizedBox(height: 24.h),

            // Visual Circles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleItem("Drive Side"),
                _buildCircleItem("Front"),
                _buildCircleItem(
                    "Passenger Side"), // Typo in design 'Passarger'
                _buildCircleItem("Back"),
              ],
            ),
            SizedBox(height: 24.h),

            // Previous Defects
            CustomText(
              "Previous Defects",
              fontWeight: FontWeight.w700,
              fontSize: 17.spMin,
              color: Colors.black87,
            ),
            SizedBox(height: 16.h),
            Obx(() => Column(
                  children: controller.defects.map((defect) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Row(
                        children: [
                          Icon(
                            defect.isResolved
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color:
                                defect.isResolved ? Colors.green : Colors.black,
                            size: 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue[100]!,
                                    Colors.white,
                                  ],
                                )),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(defect.name,
                                  fontWeight: FontWeight.bold, fontSize: 16.spMin),
                              CustomText(defect.description,
                                  color: Colors.grey, fontSize: 15.spMin),
                            ],
                          ),
                          const Spacer(),
                          CustomText(
                            defect.isResolved ? "Resolved" : "UnResolved",
                            color:
                                defect.isResolved ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.spMin,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )),

            SizedBox(height: 16.h),
            CustomText(
              "Add New vehicle Defects",
              fontWeight: FontWeight.bold,
              fontSize: 16.spMin,
            ),
            SizedBox(height: 8.h),
            CustomText(
              "It is a long established fact that a reader will be distracted by the readable",
              color: Colors.grey,
              fontSize: 15.spMin,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: OutlinedButton(
                onPressed: controller.navigateToAddDefect,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Add Defects",
                  style: TextStyle(
                    fontSize: 16.spMin,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Additional Info
            _buildTextField("License Plate", controller.licensePlateController),
            SizedBox(height: 16.h),
            _buildTextField("Odometer (mi)",
                controller.odometerController), // Typo in design 'Odomeber'

            SizedBox(height: 24.h),
            CustomText(
              "Choose Inspection Type",
              fontWeight: FontWeight.bold,
              fontSize: 16.spMin,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Obx(() => _buildInspectionButton("Pre-Trip",
                      controller.inspectionType.value == "Pre-Trip")),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Obx(() => _buildInspectionButton("Post-Trip",
                      controller.inspectionType.value == "Post-Trip")),
                ),
              ],
            ),

            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: controller.submitDvir,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController textCtrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label,
            fontWeight: FontWeight.w700,
            fontSize: 16.spMin,
            color: Colors.black87),
        SizedBox(height: 8.h),
        TextFormField(
          controller: textCtrl,
          style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleItem(String label) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[100]!,
                  Colors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4.r,
                    spreadRadius: 1.r)
              ]),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
              fontSize: 13.5.spMin,
              fontWeight: FontWeight.w600,
              color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildInspectionButton(String label, bool isSelected) {
    return InkWell(
      onTap: () => controller.setInspectionType(label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white,
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey.withOpacity(0.5),
              width: isSelected ? 1.5 : 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.spMin,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
