import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';

import '../controllers/hours_of_service_controller.dart';
import '../../../routes/app_routes.dart';

class HoursOfServiceView extends StatelessWidget {
  const HoursOfServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isResponsive = 1.sw < 600;

    double _r(double val) => isResponsive ? val.r : val;
    double _w(double val) => isResponsive ? val.w : val;
    double _h(double val) => isResponsive ? val.h : val;

    return GetBuilder<HoursOfServiceController>(
      init: HoursOfServiceController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: CustomAppBar(
            customTitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Hours of Service",
                  color: Colors.white,
                  fontSize: 18.spMin, // Fixed size
                  fontWeight: FontWeight.w600,
                ),
                Obx(() => CustomText(
                      "Driver: ${controller.currentDriver.value?.name ?? 'Unknown'}",
                      color: Colors.white70,
                      fontSize: 14.spMin, // Fixed size
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: _w(16)),
                child: IconButton(
                  icon: Icon(Icons.settings, size: 24.spMin),
                  onPressed: () => Get.toNamed(AppRoutes.DAILY_LOG),
                  color: Colors.white,
                ),
              )
            ],
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: _h(16), bottom: _h(16), left: _w(16), right: _w(16)),
            child: Column(
              children: [
                // 🔴 Return to Rest Mode
                Container(
                  padding: EdgeInsets.only(
                      top: _h(12), bottom: _h(12), left: _w(12), right: _w(12)),
                  decoration: BoxDecoration(
                    color: AppColors.redLight,
                    borderRadius: BorderRadius.circular(_r(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh,
                          color: AppColors.error, size: 20.spMin),
                      SizedBox(width: _w(8)),
                      const CustomText("Return to Rest Mode",
                          color: AppColors.error),
                    ],
                  ),
                ),
                SizedBox(height: _h(16)),

                // 🔵 Off Duty Card
                InkWell(
                  borderRadius: BorderRadius.circular(_r(16)),
                  onTap: () {
                    // Navigate to Edit Log
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: _h(16),
                        bottom: _h(16),
                        left: _w(16),
                        right: _w(16)),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueBg, // Restore Blue BG
                      borderRadius: BorderRadius.circular(_r(16)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: _w(48),
                          width: _w(48),
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
                                blurRadius: _r(10),
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            color: AppColors.primary,
                            size: 24.spMin,
                          ),
                        ),
                        SizedBox(width: _w(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Off Duty",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.spMin,
                            ),
                            SizedBox(height: _h(4)),
                            CustomText(
                              "01:07",
                              color: AppColors.textSecondary,
                              fontSize: 16.spMin,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: _h(16)),

                // ⏱ Time Boxes
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: _h(12),
                  crossAxisSpacing: _w(12),
                  childAspectRatio: 1.5,
                  children: [
                    _TimeBox("08:00", "Until Break",
                        isResponsive: isResponsive),
                    _TimeBox("11:00", "Drive", isResponsive: isResponsive),
                    _TimeBox("14:00", "Total Shift",
                        isResponsive: isResponsive),
                    _TimeBox("70:00", "Cycle", isResponsive: isResponsive),
                  ],
                ),
                SizedBox(height: _h(16)),

                // 🇺🇸 USA Property
                Container(
                  padding: EdgeInsets.only(
                      top: _h(16), bottom: _h(16), left: _w(16), right: _w(16)),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBg, // Restore Blue BG
                    borderRadius: BorderRadius.circular(_r(14)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("USA Property (8/70)",
                              fontWeight: FontWeight.w600, fontSize: 16.spMin),
                        ],
                      ),
                      SizedBox(height: _h(8)),
                      const Divider(color: Colors.white),
                      SizedBox(height: _h(8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("USA Property (8/70)",
                              color: AppColors.textSecondary,
                              fontSize: 14.spMin),
                          CustomText("70:00h / 70h",
                              color: AppColors.textSecondary,
                              fontSize: 14.spMin),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _h(16)),
                // 🔘 Buttons (Logbook / Search Client)
                Container(
                  width: double.infinity,
                  height: _h(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(_r(30)),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => {
                              controller.toggleView(true),
                              Get.toNamed(AppRoutes.LOGBOOK),
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.isLogbook.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(_r(30)),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                "Logbook",
                                color: controller.isLogbook.value
                                    ? Colors.white
                                    : Colors.black, // Or AppColors.textPrimary
                                fontWeight: FontWeight.w600,
                                fontSize: 16.spMin,
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
                                borderRadius: BorderRadius.circular(_r(30)),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                "Search Client",
                                color: !controller.isLogbook.value
                                    ? Colors.white
                                    : Colors.black, // Or AppColors.textPrimary
                                fontWeight: FontWeight.w500,
                                fontSize: 16.spMin,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: _h(16)),

                // 📜 Certified list
                Container(
                  padding: EdgeInsets.only(
                      top: _h(16), bottom: _h(16), left: _w(16), right: _w(16)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(_r(14)),
                  ),
                  child: Column(
                    children: [
                      _CertRow("Today", "00:00 hours", "Uncertified",
                          isResponsive: isResponsive),
                      _CertRow("Sat, Oct 18", "00:00 hours", "Uncertified",
                          isResponsive: isResponsive),
                      _CertRow("Fri, Oct 17", "00:00 hours", "Uncertified",
                          isResponsive: isResponsive),
                      _CertRow("Thu, Oct 16", "00:00 hours", "Certified",
                          isResponsive: isResponsive),
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
  final bool isResponsive;

  const _TimeBox(this.time, this.label, {this.isResponsive = true});

  @override
  Widget build(BuildContext context) {
    double _r(double val) => isResponsive ? val.r : val;
    double _w(double val) => isResponsive ? val.w : val;
    double _h(double val) => isResponsive ? val.h : val;

    return Container(
      padding: EdgeInsets.only(
          top: _h(16), bottom: _h(16), left: _w(16), right: _w(16)),
      decoration: BoxDecoration(
        color: AppColors.lightGreenBg, // Light Green BG
        borderRadius: BorderRadius.circular(_r(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: _h(8), bottom: _h(8), left: _w(8), right: _w(8)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.success, width: _w(1.5)),
                ),
                child: Icon(Icons.access_time,
                    size: 16.spMin, color: AppColors.success),
              ),
              SizedBox(width: _w(8)),
              CustomText(time, fontSize: 18.spMin, fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: _h(8)),
          CustomText(label, fontSize: 16.spMin, color: Colors.black87),
        ],
      ),
    );
  }
}

class _CertRow extends StatelessWidget {
  final String day, time, status;
  final bool isResponsive;

  const _CertRow(this.day, this.time, this.status, {this.isResponsive = true});

  @override
  Widget build(BuildContext context) {
    double _r(double val) => isResponsive ? val.r : val;
    double _w(double val) => isResponsive ? val.w : val;
    double _h(double val) => isResponsive ? val.h : val;

    final isCertified = status == "Certified";

    return InkWell(
      borderRadius: BorderRadius.circular(_r(12)),
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: _h(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(day, fontWeight: FontWeight.w600),
                CustomText(time,
                    fontSize: 12.spMin, color: AppColors.textSecondary),
              ],
            ),
            Row(
              children: [
                CustomText(
                  status,
                  color: isCertified ? AppColors.success : AppColors.error,
                ),
                SizedBox(width: _w(8)),
                Icon(Icons.chevron_right,
                    size: 20.spMin, color: Colors.black38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
