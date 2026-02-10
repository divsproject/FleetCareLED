import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

import '../controllers/hours_of_service_controller.dart';
import '../../../routes/app_routes.dart';

class HoursOfServiceView extends StatelessWidget {
  const HoursOfServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HoursOfServiceController>(
      init: HoursOfServiceController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Hours of Service",
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                Obx(() => CustomText(
                      "Driver: ${controller.currentDriver.value?.name ?? 'Unknown'}",
                      color: Colors.white70,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 24.sp),
              onPressed: () => Get.back(),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: IconButton(
                  icon: Icon(Icons.settings, size: 24.sp),
                  onPressed: () => Get.toNamed(AppRoutes.DAILY_LOG),
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // 🔴 Return to Rest Mode
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.redLight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: AppColors.error, size: 20.sp),
                      SizedBox(width: 8.w),
                      const CustomText("Return to Rest Mode",
                          color: AppColors.error),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // 🔵 Off Duty Card
                InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {
                    // Navigate to Edit Log
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueBg, // Restore Blue BG
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 48.w,
                          width: 48.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Colors.white, Color(0xFFB3E5FC)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 10.r,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            color: AppColors.primary,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Off Duty",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              "01:07",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // ⏱ Time Boxes
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 1.5,
                  children: const [
                    _TimeBox("08:00", "Until Break"),
                    _TimeBox("11:00", "Drive"),
                    _TimeBox("14:00", "Total Shift"),
                    _TimeBox("70:00", "Cycle"),
                  ],
                ),
                SizedBox(height: 16.h),

                // 🇺🇸 USA Property
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBg, // Restore Blue BG
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("USA Property (8/70)",
                              fontWeight: FontWeight.w600, fontSize: 16.sp),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const Divider(color: Colors.white),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("USA Property (8/70)",
                              color: AppColors.textSecondary, fontSize: 14.sp),
                          CustomText("70:00h / 70h",
                              color: AppColors.textSecondary, fontSize: 14.sp),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                // 🔘 Buttons (Logbook / Search Client)
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.toggleView(true),
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.isLogbook.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                "Logbook",
                                color: controller.isLogbook.value
                                    ? Colors.white
                                    : Colors.black, // Or AppColors.textPrimary
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.toggleView(false),
                            child: Container(
                              decoration: BoxDecoration(
                                color: !controller.isLogbook.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                "Search Client",
                                color: !controller.isLogbook.value
                                    ? Colors.white
                                    : Colors.black, // Or AppColors.textPrimary
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // 📜 Certified list
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: const Column(
                    children: [
                      _CertRow("Today", "00:00 hours", "Uncertified"),
                      _CertRow("Sat, Oct 18", "00:00 hours", "Uncertified"),
                      _CertRow("Fri, Oct 17", "00:00 hours", "Uncertified"),
                      _CertRow("Thu, Oct 16", "00:00 hours", "Certified"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TimeBox extends StatelessWidget {
  final String time;
  final String label;
  const _TimeBox(this.time, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.lightGreenBg, // Light Green BG
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.success, width: 1.5.w),
                ),
                child: Icon(Icons.access_time,
                    size: 16.sp, color: AppColors.success),
              ),
              SizedBox(width: 8.w),
              CustomText(time, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(label, fontSize: 16.sp, color: Colors.black87),
        ],
      ),
    );
  }
}

class _CertRow extends StatelessWidget {
  final String day, time, status;
  const _CertRow(this.day, this.time, this.status);

  @override
  Widget build(BuildContext context) {
    final isCertified = status == "Certified";

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(day, fontWeight: FontWeight.w600),
                CustomText(time,
                    fontSize: 12.sp, color: AppColors.textSecondary),
              ],
            ),
            Row(
              children: [
                CustomText(
                  status,
                  color: isCertified ? AppColors.success : AppColors.error,
                ),
                SizedBox(width: 8.w),
                Icon(Icons.chevron_right, size: 20.sp, color: Colors.black38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
