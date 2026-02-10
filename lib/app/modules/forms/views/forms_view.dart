import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

class FormsView extends StatelessWidget {
  const FormsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: CustomText(
          "Forms",
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            // 🔹 Last Issue Card
            Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("Tyre Issue", fontSize: 14.sp),
                  CustomText(
                    "Oct 8 • 8:08 PM",
                    color: AppColors.textSecondary,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // 🔹 Start a Form
            CustomButton(
              label: "Start a Form",
              onPressed: () {},
              borderRadius: 24.r,
              height: 48.h,
            ),
            SizedBox(height: 12.h),

            // 🔹 Create an Issue
            CustomButton(
              label: "Create an Issue",
              onPressed: () {},
              isOutlined: true,
              borderRadius: 24.r,
              height: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
