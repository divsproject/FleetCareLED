import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if we can go back (i.e., not accessed directly from bottom nav)
    final bool canGoBack = Navigator.of(context).canPop();

    return Scaffold(
      backgroundColor: Colors.white, // As per design
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF), // Matching dashboard blue
        automaticallyImplyLeading: canGoBack,
        leading: canGoBack
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
                onPressed: () => Get.back(),
              )
            : null,
        title: CustomText(
          "Edit Driver Profile",
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w), // Adjusted to 16.w for better spacing
        child: Column(
          children: [
            // Profile Image Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100.w, // Adjusted size
                        height: 100.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/user_placeholder.png"), // Placeholder
                              fit: BoxFit.cover,
                            )),
                        // In real app, use NetworkImage or FileImage based on controller.profileImage
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: controller.pickImage,
                          child: CircleAvatar(
                            radius: 18.r, // Adjusted size
                            backgroundColor: Colors.amber, // As per design
                            child: Icon(Icons.camera_alt_outlined,
                                color: Colors.black, size: 20.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomText("Upload Photo",
                      fontWeight: FontWeight.bold, fontSize: 16.sp),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Fields
            _buildField("Driver Name", "Enter Name", controller.nameController),
            _buildField("Driver Number", "Enter Driver Number",
                controller.driverNumberController),
            _buildField("Truck Number", "Enter Truck Number",
                controller.truckNumberController),
            _buildField("Aadhar Card Number", "Enter Aadhar Card Number",
                controller.aadharController),
            _buildField("Driver License", "Enter Driver License",
                controller.licenseController),
            _buildField("Truck RC Book", "Enter Truck RC Book",
                controller.truckRcController),

            SizedBox(height: 20.h),

            // Save Button
            CustomButton(
              label: "Save",
              onPressed: controller.saveProfile,
              backgroundColor: const Color(0xFF2AA6DF), // Matching design blue
              borderRadius: 30.r, // Rounded full
              height: 50.h,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
      String label, String hint, TextEditingController textController) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(label, fontWeight: FontWeight.bold, fontSize: 14.sp),
          SizedBox(height: 8.h),
          CustomTextField(
            controller: textController,
            hintText: hint,
            // Adjust CustomTextField if needed or trust it's standard style
            // Assuming CustomTextField has standard border from previous tasks
          ),
        ],
      ),
    );
  }
}
