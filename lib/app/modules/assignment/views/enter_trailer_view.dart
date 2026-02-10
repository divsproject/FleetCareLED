import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/assignment_controller.dart';

class EnterTrailerView extends StatelessWidget {
  const EnterTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            title: CustomText(
              "Trailer",
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 24.sp),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // 🔹 Input
                const CustomTextField(
                  label: "Trailer",
                  hintText: "Enter Trailer Number",
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
