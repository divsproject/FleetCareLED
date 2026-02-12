import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/daily_log_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../widgets/hos_daily_graph.dart';
import 'trailer_view.dart';
import 'shipping_id_view.dart';

class DailyLogView extends StatelessWidget {
  const DailyLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyLogController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: CustomAppBar(
            title: "Daily Log",
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Icon(Icons.edit_note, size: 24.sp, color: Colors.white),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                // 📅 Date Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_left, size: 24.sp),
                      ),
                      CustomText(
                        "Sunday, Oct 19th, 2025",
                        fontWeight: FontWeight.bold,
                        fontSize: 17.spMin, // Increased
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, size: 24.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // 📊 Graph
                const HosDailyGraph(),
                SizedBox(height: 16.h),

                // 📝 Forms Section
                _buildSectionCard("Forms", [
                  _buildNavItem("Trailer",
                      onTap: () => Get.to(() => const TrailerView())),
                  const Divider(),
                  _buildNavItem("Shipping IDs",
                      onTap: () => Get.to(() => const ShippingIdView())),
                ]),
                SizedBox(height: 16.h),

                // 📋 Logs Section
                Container(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            "Logs",
                            fontSize: 17.spMin, // Matched section headers
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueBg,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w, right: 8.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [Colors.white, Color(0xFFB3E5FC)],
                                ),
                              ),
                              child: Icon(Icons.power_settings_new,
                                  color: AppColors.primary, size: 20.sp),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText("Off Duty",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.spMin),
                                    SizedBox(width: 8.w),
                                    CustomText("12:00 AM - 5h 3m",
                                        color: AppColors.primary,
                                        fontSize: 14.spMin),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                CustomText("No Location",
                                    color: AppColors.textSecondary,
                                    fontSize: 14.spMin),
                              ],
                            )),
                            Icon(Icons.edit_outlined,
                                color: AppColors.primary, size: 20.sp),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const Divider(),
                      _buildNavItem("Add Remark"),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // 🛡️ Exemptions
                _buildSectionCard("Exemptions", [
                  _buildNavItem("Adverse Driving (USA)"),
                ]),
                SizedBox(height: 16.h),

                // ➕ More Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("More",
                          fontSize: 17.spMin, fontWeight: FontWeight.bold),
                      SizedBox(height: 16.h),
                      CustomText("Ruleset",
                          fontWeight: FontWeight.bold, fontSize: 16.spMin),
                      SizedBox(height: 4.h),
                      CustomText("USA 70 hour / 8 day",
                          color: AppColors.textSecondary, fontSize: 15.spMin),
                      SizedBox(height: 8.h),
                      const Divider(),
                      SizedBox(height: 8.h),
                      CustomText("Time zone",
                          fontWeight: FontWeight.bold, fontSize: 16.spMin),
                      SizedBox(height: 4.h),
                      CustomText("America/New_York",
                          color: AppColors.textSecondary, fontSize: 15.spMin),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // ✅ Certify Button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                    ),
                    child: CustomText("Certify and Submit",
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
      },
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title, fontSize: 17.spMin, fontWeight: FontWeight.bold),
          SizedBox(height: 8.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title, fontSize: 16.spMin, fontWeight: FontWeight.w600),
            Icon(Icons.chevron_right, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
