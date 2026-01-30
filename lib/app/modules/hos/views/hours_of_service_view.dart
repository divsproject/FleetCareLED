import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';

class HoursOfServiceView extends StatelessWidget {
  const HoursOfServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomText(
          "Hours of Service",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔴 Return to Rest Mode
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.redLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, color: AppColors.error, size: 18),
                  SizedBox(width: 6),
                  CustomText("Return to Rest Mode", color: AppColors.error),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // 🔵 Off Duty Card
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                // Navigate to Edit Log
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightBlueBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.power_settings_new,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Off Duty",
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          "01:07",
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ⏱ Time Boxes
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                _TimeBox("08:00", "Until Break"),
                _TimeBox("11:00", "Drive"),
                _TimeBox("14:00", "Total Shift"),
                _TimeBox("70:00", "Cycle"),
              ],
            ),
            const SizedBox(height: 16),

            // 🇺🇸 USA Property
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.lightBlueBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("USA Property (8/70)",
                      fontWeight: FontWeight.w600),
                  CustomText("70:00h / 70h", color: AppColors.textSecondary),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // 🔘 Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Logbook",
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    label: "Search Client",
                    isOutlined: true,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // 📜 Certified list
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
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
  }
}

class _TimeBox extends StatelessWidget {
  final String time;
  final String label;
  const _TimeBox(this.time, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.lightGreenBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.lightGreenIconBg,
            child: Icon(Icons.access_time, size: 16, color: AppColors.success),
          ),
          const SizedBox(height: 10),
          CustomText(time, fontSize: 20, fontWeight: FontWeight.bold),
          CustomText(label, fontSize: 12, color: AppColors.textSecondary),
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
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(day, fontWeight: FontWeight.w600),
                CustomText(time, fontSize: 12, color: AppColors.textSecondary),
              ],
            ),
            Row(
              children: [
                CustomText(
                  status,
                  color: isCertified ? AppColors.success : AppColors.error,
                ),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right,
                    size: 18, color: Colors.black38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
