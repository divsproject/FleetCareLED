import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';

class ShippingIdView extends StatelessWidget {
  const ShippingIdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: "Shipping ID",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText("Shipping ID",
                fontWeight: FontWeight.bold, fontSize: 16.spMin),
            SizedBox(height: 8.h),
            const CustomTextField(hintText: ""),
            SizedBox(height: 16.h),

            // Suggestions Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w, right: 12.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5.r,
                      offset: Offset(0, 2.h),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("Suggestions",
                      color: Colors.grey, fontSize: 14.spMin),
                  SizedBox(height: 8.h),
                  CustomText("Hello",
                      fontWeight: FontWeight.bold, fontSize: 16.spMin),
                ],
              ),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                ),
                child: CustomText("Save",
                    color: Colors.white,
                    fontSize: 17.spMin,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
