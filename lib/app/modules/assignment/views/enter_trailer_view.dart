import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_button.dart';

import '../../../global_widgets/custom_text_field.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/assignment_controller.dart';

class EnterTrailerView extends StatelessWidget {
  const EnterTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: const CustomAppBar(
            title: "Trailer",
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
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
