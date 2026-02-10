import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';

class FuelingView extends StatelessWidget {
  const FuelingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: CustomText(
          "Fueling",
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
            // 🔹 Top Stats
            Container(
              padding: EdgeInsets.all(16.r),
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
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          label,
          fontSize: 12.sp,
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
      padding: EdgeInsets.all(14.r),
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
            fontSize: 14.sp,
          ),
          SizedBox(height: 4.h),
          CustomText(
            "OCT 8 • 09:08 PM • Kalupur Station",
            fontSize: 12.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
