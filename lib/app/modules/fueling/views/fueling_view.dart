import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';

class FuelingView extends StatelessWidget {
  const FuelingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: "Fueling",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            // 🔹 Top Stats
            Container(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Stat("35000", "km"),
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: AppColors.lightBlueBg,
                    child: Icon(Icons.local_shipping,
                        color: AppColors.primary, size: 24.sp),
                  ),
                  _Stat("800", "Avg"),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // 🔹 Fueling List
            Expanded(
              child: ListView(
                children: const [
                  _FuelTile(),
                  _FuelTile(),
                  _FuelTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          value,
          fontSize: 18.spMin,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          label,
          fontSize: 12.spMin,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}

class _FuelTile extends StatelessWidget {
  const _FuelTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.only(top: 14.h, bottom: 14.h, left: 14.w, right: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "55000 INR",
            fontWeight: FontWeight.w600,
            fontSize: 14.spMin,
          ),
          SizedBox(height: 4.h),
          CustomText(
            "OCT 8 • 09:08 PM • Kalupur Station",
            fontSize: 12.spMin,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
