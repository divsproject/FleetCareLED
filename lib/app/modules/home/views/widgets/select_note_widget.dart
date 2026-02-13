import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../global_widgets/custom_text.dart';
import '../../../../global_widgets/custom_text_field.dart';
import '../../../../global_widgets/custom_button.dart';

class SelectNoteWidget extends StatelessWidget {
  const SelectNoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> notes = [
      "Custom Entry",
      "Pre-Trip Inspection",
      "Pre-Trip Unloading",
      "Pre-Trip Loading",
      "Brake Check",
      "Break",
      "Fuel",
      "Fuel & Pre-Trip",
      "Road Inspection",
      "Post-Trip Inspection",
      "Unloading",
      "Loading",
      "Load Securement Checking",
      "Trailer Pickup",
      "Trailer Drop",
      "Check Out",
      "Truck Wash",
      "Truck Repair",
      "Hookup And Pickup Trailer",
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const CustomText(
          "Select Note",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 12.h, bottom: 12.h, left: 12.w, right: 12.w),
            child: const CustomTextField(
              hintText: "Search Note",
              suffixIcon: Icon(Icons.search, color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: CustomText(notes[index]),
                  onTap: () {
                    Get.back(result: notes[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 12.h, bottom: 12.h, left: 12.w, right: 12.w),
            child: CustomButton(
              label: "Confirm",
              onPressed: () {
                Get.back();
              },
              borderRadius: 24,
            ),
          ),
        ],
      ),
    );
  }
}
