import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Help",
        bgColor: const Color(0xFF2AA6DF), // Matching Settings AppBar color
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {
              // Placeholder for edit action if needed, as seen in screenshot
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Power data malfunctions :",
              fontSize: 17.spMin,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 16.h),
            Text(
              "The ELD records a power data malfunctions when an ELD is not powered for a cumulative in-motions driving time of 30 minutes or more over a 24-hour period, for all drivers.",
              style: TextStyle(
                fontSize: 15.spMin,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.h),
            CustomText(
              "What should i do next?",
              fontSize: 17.spMin,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 16.h),
            _buildBulletPoint(
                "This may be caused by an intermittent or complete disconnection from the vehicle ECM. This is likely due to an installation issue with the telematics device."),
            _buildBulletPoint(
                "Contact your carrier to inspect the install if you are unable to check yourself."),
            _buildBulletPoint(
                "Once the problem is investigated and resolved, you may clear the event."),
            const Spacer(),
            Center(
              child: Text(
                "For any questions or concerns, contact your administrator.",
                style: TextStyle(
                  fontSize: 14.spMin,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: controller.close,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.5.h),
            child: Icon(Icons.circle, size: 6.sp, color: Colors.grey[600]),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.spMin,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
