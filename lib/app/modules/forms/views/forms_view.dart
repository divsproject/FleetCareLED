import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';

class FormsView extends StatelessWidget {
  const FormsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: "Forms",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            // 🔹 Last Issue Card
            Container(
              padding: EdgeInsets.only(top: 14.h, bottom: 14.h, left: 14.w, right: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("Tyre Issue", fontSize: 14.spMin),
                  CustomText(
                    "Oct 8 • 8:08 PM",
                    color: AppColors.textSecondary,
                    fontSize: 12.spMin,
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
