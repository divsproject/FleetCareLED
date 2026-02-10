import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/assignment_controller.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      init: AssignmentController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            title: CustomText(
              "Assignments",
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 24.sp),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _AssignmentCard(
                      icon: Icons.local_shipping,
                      title: "Vehicle",
                      subtitle: "Select Vehicle",
                      onTap: () => controller.navigateToSelectVehicle(),
                    ),
                    SizedBox(height: 20.h),
                    _AssignmentCard(
                      icon: Icons.view_list,
                      title: "Trailer(s)",
                      subtitle:
                          "Add a Ship-related Trailer(s) or No Trailer ID",
                      big: true,
                      onTap: () => controller.navigateToEnterTrailer(),
                    ),
                    SizedBox(height: 20.h),
                    _AssignmentCard(
                      icon: Icons.inventory_2,
                      title: "Shipping IDs",
                      subtitle: "Add a Shipping ID",
                      onTap: () => controller.navigateToAddShippingId(),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
            child: CustomButton(
              label: "Done",
              onPressed: controller.completeAssignment,
              height: 52.h,
              borderRadius: 30.r,
            ),
          ),
        );
      },
    );
  }
}

/* ---------------- CARD WIDGET ---------------- */
class _AssignmentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool big;
  final VoidCallback? onTap;

  const _AssignmentCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.big = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(vertical: big ? 28.h : 22.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10.r,
              offset: Offset(0, 6.h),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: const Color(0xFFEAF6FF),
              child: Icon(icon, color: AppColors.primary, size: 26.sp),
            ),
            SizedBox(height: 10.h),
            CustomText(
              title,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
            SizedBox(height: 4.h),
            CustomText(
              subtitle,
              textAlign: TextAlign.center,
              fontSize: 12.sp,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
