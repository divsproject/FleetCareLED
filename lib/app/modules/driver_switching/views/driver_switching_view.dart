import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../services/driver_service.dart';
import '../controllers/driver_switching_controller.dart';

class DriverSwitchingView extends GetView<DriverSwitchingController> {
  const DriverSwitchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Driver Switching",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Drivers",
              fontWeight: FontWeight.bold,
              fontSize: 17.spMin,
              color: Colors.black,
            ),
            SizedBox(height: 16.h),
            Obx(() => Column(
                  children: controller.drivers.map((driver) {
                    return _buildDriverTile(driver);
                  }).toList(),
                )),
            SizedBox(height: 32.h),
            CustomText(
              "Switching Drivers",
              fontWeight: FontWeight.bold,
              fontSize: 17.spMin,
              color: Colors.black,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Obx(() => _buildDriverCard(
                        controller.currentDriver.value, "Current Driver"))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      _buildArrowButton(Icons.arrow_forward),
                      SizedBox(height: 8.h),
                      _buildArrowButton(Icons.arrow_back),
                    ],
                  ),
                ),
                Expanded(
                    child: Obx(() => _buildDriverCard(
                        controller.coDriver.value, "Co-Driver"))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverTile(DriverProfile driver) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[50],
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
            ),
            alignment: Alignment.center,
            child: Text(
              "${driver.id}",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 15.spMin,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(children: [
            Text(
              driver.name,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Obx(() {
              if (controller.currentDriver.value?.id == driver.id) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.success),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 12.h,
                        decoration: const BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Current Driver",
                        style: TextStyle(
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ]),
          const Spacer(),
          TextButton(
            onPressed: () => controller.editDriver(driver.id),
            child: Text(
              "Edit",
              style: TextStyle(
                fontSize: 15.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDriverCard(DriverProfile? driver, String label) {
    if (driver == null) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: driver.image.isNotEmpty
                ? AssetImage(driver.image)
                : const AssetImage("assets/images/user_placeholder.png")
                    as ImageProvider, // Fallback need placeholder
            backgroundColor: Colors.grey[200],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.blue[50], // Light blue bubble
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize:
                    12.spMin, // Slightly reduced font size for longer text
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            driver.name,
            style: TextStyle(
              fontSize: 15.spMin,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon) {
    return InkWell(
      onTap: controller.switchDriver,
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: const BoxDecoration(
          color: AppColors.primary, // Blue button
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20.spMin),
      ),
    );
  }
}
