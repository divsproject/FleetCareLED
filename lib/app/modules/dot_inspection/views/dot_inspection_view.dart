import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/dot_inspection_controller.dart';

class DotInspectionView extends GetView<DotInspectionController> {
  const DotInspectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          "DOT Inspection Mode",
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            // Section 1
            _buildSection(
              title:
                  "Inspect Logs Fir Previous & days + today", // Typo from image 'Fir' -> For? Image says 'Fir'. Sticking to image text or correcting? Image says "Fir Previous & days". Assuming "&" is 8 (shift+7). Correcting to standard English.
              // "Inspect Logs Fir Previous & days + today" -> "Inspect Logs For Previous 8 days + today"
              description:
                  "Select 'Begin Inspection' and hand your phone to the officer",
              buttonLabel: "Begin Inspection",
              onTap: controller.beginInspection,
              footer: "Press and hold to set an access code",
            ),

            Divider(color: Colors.grey.shade300, thickness: 1, height: 48.h),

            // Section 2
            _buildSection(
              title: "Send ELD Output File to DOT",
              description:
                  "Send your ELD Output File to the DOT if the officer Requests it",
              buttonLabel: "Send Output File",
              onTap: controller.sendEldOutputFile,
            ),

            Divider(color: Colors.grey.shade300, thickness: 1, height: 48.h),

            // Section 3
            _buildSection(
              title: "Send logs For previous 7 days + todays",
              description:
                  "Fax or email email logs to the officer if they request a paper copy of your logs",
              buttonLabel: "Send Output File",
              onTap: controller.sendLogs,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required String buttonLabel,
    required VoidCallback onTap,
    String? footer,
  }) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.5.sp, // ~16-17sp
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp, // ~14-15sp
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: 260.w, // Max width for button
          height: 48.h,
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              backgroundColor: Colors.white,
            ),
            child: Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary, // Blue text
              ),
            ),
          ),
        ),
        if (footer != null) ...[
          SizedBox(height: 16.h),
          Text(
            footer,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ]
      ],
    );
  }
}
