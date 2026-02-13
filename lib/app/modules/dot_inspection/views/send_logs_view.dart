import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/dot_inspection_controller.dart';

class SendLogsView extends GetView<DotInspectionController> {
  const SendLogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isEmail = true.obs;
    final RxBool showSuccess = false.obs;
    final TextEditingController faxController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Send Logs & inspections",
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
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
                        onTap: () => isEmail.value = true,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isEmail.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          child: CustomText(
                            "Email",
                            textAlign: TextAlign.center,
                            color:
                                isEmail.value ? AppColors.primary : Colors.grey,
                            fontSize: 15.spMin,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Obx(() => InkWell(
                        onTap: () => isEmail.value = false,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: !isEmail.value
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          child: CustomText(
                            "Fax",
                            textAlign: TextAlign.center,
                            color: !isEmail.value
                                ? AppColors.primary
                                : Colors.grey,
                            fontSize: 15.spMin,
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
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  color: Colors.green,
                  child: CustomText(
                    "Your Logs are being faxed to (248) 765-83-8395.",
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : SizedBox()),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isEmail.value) ...[
                        CustomText(
                          "Fax 8 Logs & 2 Vehicle Inspections & 2 Vehicle Inspections",
                          fontSize: 14.spMin,
                          color: Colors.grey[700],
                        ),
                        SizedBox(height: 24.h),
                        CustomText(
                          "RECIPIENT FAX",
                          fontSize: 14.spMin,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          controller: faxController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Fax Number",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                          ),
                        ),
                      ],
                      SizedBox(height: 40.h),
                      Center(
                        child: SizedBox(
                          width: 260.w,
                          height: 48.h,
                          child: OutlinedButton(
                            onPressed: () {
                              showSuccess.value = true;
                              Future.delayed(Duration(seconds: 2), () {
                                showSuccess.value = false;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: AppColors.primary, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: CustomText(
                              "Send",
                              color: AppColors.primary,
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
