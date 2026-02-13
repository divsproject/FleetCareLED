import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';

import '../../../global_widgets/custom_text_field.dart';
import '../controllers/dvir_controller.dart';

class AddDefectView extends GetView<DvirController> {
  const AddDefectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Add New vehicale defects",
        actions: [
          TextButton(
            onPressed: controller.saveDefects,
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // 🔍 Search bar
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
            child: CustomTextField(
              hintText: "Search here...",
              prefixIcon: Icon(Icons.search, color: Colors.black, size: 24.sp),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                ...controller.defectCategories.entries.map((entry) {
                  return _buildCategorySection(entry.key, entry.value);
                }).toList(),

                // Camera Button Section (Mocking under 'Other' or separate)
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 56.h,
                      width: 56.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.blue.withOpacity(0.3), width: 1),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.blue.shade50, Colors.white])),
                      child: Icon(Icons.camera_alt,
                          color: Colors.blue, size: 24.sp),
                    ),
                  ),
                ),

                // Comment Section
                Container(
                  height: 64.h,
                  width: double.infinity,
                  color: Colors.grey.shade50,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Comment",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          color: Colors.grey.shade100,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        ...items
            .map((item) => Obx(() {
                  final isSelected = controller.selectedDefects.contains(item);
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        value: isSelected,
                        onChanged: (val) => controller.toggleDefect(item),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                        activeColor: AppColors.primary,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey.shade200,
                        indent: 16.w,
                        endIndent: 16.w,
                      ),
                    ],
                  );
                }))
            .toList(),
      ],
    );
  }
}
