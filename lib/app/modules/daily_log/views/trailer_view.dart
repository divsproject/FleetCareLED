import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';

class TrailerView extends StatelessWidget {
  const TrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: "Trailer",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText("Trailer", fontWeight: FontWeight.bold, fontSize: 16.spMin),
            SizedBox(height: 8.h),
            const CustomTextField(hintText: ""),
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
            SizedBox(height: 16.h), // Safe area/bottom padding
          ],
        ),
      ),
    );
  }
}
