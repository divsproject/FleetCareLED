import 'package:fleetcare_eld/app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_button.dart';

import '../../../global_widgets/custom_text_field.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/assignment_controller.dart';

class EnterShippingView extends StatelessWidget {
  const EnterShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: const CustomAppBar(
            title: "Shipping ID",
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                // 🔹 Input
                const CustomTextField(
                  label: "Shipping ID",
                  hintText: "Enter Shipping ID",
                ),

                SizedBox(height: 12.h),

                // 🔹 Suggestion
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    "Suggestions\nHello",
                    color: Colors.grey.shade600,
                    fontSize: 12.spMin,
                  ),
                ),

                const Spacer(),

                // 🔹 Save Button
                CustomButton(
                  label: "Save",
                  onPressed: () => Get.back(),
                  height: 48.h,
                  borderRadius: 24.r,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
