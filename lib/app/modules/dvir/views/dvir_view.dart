import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_routes.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

class DvirView extends StatelessWidget {
  const DvirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: "DVIRs",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.lightBlueBg,
            child:
                Icon(Icons.assignment, size: 36.sp, color: AppColors.primary),
          ),
          SizedBox(height: 16.h),
          CustomText(
            "No DVIRs Available",
            fontWeight: FontWeight.w600,
            fontSize: 16.spMin,
          ),
          SizedBox(height: 6.h),
          CustomText(
            "Tap the button below to create a DVIR.",
            color: AppColors.textSecondary,
            fontSize: 12.spMin,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: CustomButton(
              label: "Create DVIR",
              height: 46,
              borderRadius: 24,
              onPressed: () {
                Get.toNamed(AppRoutes.CREATE_DVIR);
              },
            ),
          ),
        ],
      ),
    );
  }
}
