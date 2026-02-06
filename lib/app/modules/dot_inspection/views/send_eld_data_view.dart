import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/dot_inspection_controller.dart';

class SendEldDataView extends GetView<DotInspectionController> {
  const SendEldDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isWebService = true.obs;
    final RxBool showSuccess = false.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          "Send Output File",
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 20.sp),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => InkWell(
                        onTap: () => isWebService.value = true,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isWebService.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          child: CustomText(
                            "Web Service",
                            textAlign: TextAlign.center,
                            color: isWebService.value
                                ? AppColors.primary
                                : Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Obx(() => InkWell(
                        onTap: () => isWebService.value = false,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: !isWebService.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          child: CustomText(
                            "Email",
                            textAlign: TextAlign.center,
                            color: !isWebService.value
                                ? AppColors.primary
                                : Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),

          // Success Banner
          Obx(() => showSuccess.value
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  color: Colors.green,
                  child: CustomText(
                    "ELD Output File Send Successfully.",
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : SizedBox()),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Send ELD data for the last 8 days for vehicle SIM-00012844SLM-00012844",
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
                  SizedBox(height: 3.h),
                  CustomText(
                    "OFFICIAL COMMENT",
                    fontSize: 14.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: SizedBox(
                      width: 70.w,
                      height: 6.h,
                      child: OutlinedButton(
                        onPressed: () {
                          showSuccess.value = true;
                          Future.delayed(Duration(seconds: 2), () {
                            showSuccess.value = false;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primary, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: CustomText(
                          "Send",
                          color: AppColors.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
