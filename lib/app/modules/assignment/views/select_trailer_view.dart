import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';

import '../controllers/assignment_controller.dart';

class SelectTrailerView extends StatelessWidget {
  const SelectTrailerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: "Select Trailer(s)",
            actions: [
              IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 24.spMin),
                onPressed: () => controller.navigateToManualTrailer(),
              )
            ],
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // 🔍 Search bar
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                    child: CustomTextField(
                      hintText: "Search here...",
                      suffixIcon:
                          Icon(Icons.search, color: Colors.grey, size: 24.sp),
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        // Suggested Section
                        Column(
                          children: [
                            _buildSectionHeaderBox("Suggested (1)"),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.r),
                                    bottomRight: Radius.circular(12.r)),
                              ),
                              child: _trailerTile(
                                trailer: "TR-101A",
                                controller: controller,
                                subtitle: "Last Selected",
                                isFirst: true,
                                isLast: true,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24.h),

                        // Other Trailers Section
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              _buildSectionHeaderBox(
                                  "Other Trailers (${controller.trailers.length})"),
                              ...controller.trailers
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final index = entry.key;
                                final trailer = entry.value;
                                return _trailerTile(
                                  trailer: trailer,
                                  controller: controller,
                                  isFirst: false,
                                  isLast:
                                      index == controller.trailers.length - 1,
                                  showDivider:
                                      index != controller.trailers.length - 1,
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              // DONE button
              Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: CustomButton(
              label: "Done",
              height: 50.h,
              width: double.infinity,
              borderRadius: 30.r,
              onPressed: () {
                Get.back();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeaderBox(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF8FE), // Light blue background
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _trailerTile({
    required String trailer,
    required AssignmentController controller,
    String? subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool showDivider = false,
  }) {
    final bool isSelected = controller.selectedTrailer.value == trailer;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          title: Text(
            trailer,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : Colors.black,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 13.5),
                )
              : null,
          trailing: isSelected
              ? Icon(Icons.check_circle,
                  color: AppColors.primary, size: 22.spMin)
              : null,
          onTap: () {
            controller.setSelectedTrailer(trailer);
          },
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade200,
            indent: 16.w,
            endIndent: 16.w,
          ),
      ],
    );
  }
}
