import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/values/app_colors.dart';

import '../../../global_widgets/custom_app_bar.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Setting",
        bgColor: const Color(0xFF2AA6DF),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 24.sp),
            onPressed: () {
              // Edit action placeholder
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            _buildSection(
              title: "General",
              children: [
                _buildItem("Help", onTap: controller.openHelp),
                _buildItem("Language", onTap: controller.changeLanguage),
                _buildItem("Theme", onTap: controller.changeTheme),
                _buildItem("Font", onTap: controller.openFontSettings),
                _buildItem("Display & Brightness",
                    onTap: controller.openDisplaySettings),
              ],
            ),
            SizedBox(height: 16.h),
            _buildSection(
              title: "HOS & Compliance",
              children: [
                _buildItem("HOS Settings", onTap: controller.openHosSettings),
                _buildItem("USA Exemptions",
                    onTap: () => _showExemptionsDialog(context, controller,
                        isUsa: true)),
                _buildItem("Canada Exemptions",
                    onTap: () => _showExemptionsDialog(context, controller,
                        isUsa: false)),
              ],
            ),
            SizedBox(height: 16.h),
            _buildSection(
              title: "Vehicle & Device",
              children: [
                _buildItem("Pin vehicle to device",
                    onTap: controller.pinVehicleToDevice),
                _buildItem("Permissions Status",
                    onTap: controller.checkPermissionsStatus),
                _buildItem("OBD Troubleshooting",
                    onTap: () => _showObdDialog(context, controller)),
              ],
            ),
            SizedBox(height: 16.h),
            _buildSection(
              title: "Application Details",
              children: [
                _buildItem("Send Feedback", onTap: controller.sendFeedback),
                _buildItem("Version", onTap: controller.showVersion),
              ],
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
            0xFFF7F9FC), // Light grey/blue background for the specific item
        // Actually the image shows the Header has a background, and the items are below.
        // Let's wrap everything in a "Card" lookalike.
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFEBF7FC), // Light blue header background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          // Items
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC), // Very light background for items
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15.spMin,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  // 🚛 Exemptions Dialog - Re-implemented to support existing controller logic but cleaner
  void _showExemptionsDialog(
      BuildContext context, SettingsController controller,
      {required bool isUsa}) {
    Get.defaultDialog(
      title: isUsa ? "USA Exemptions" : "Canada Exemptions",
      content: SizedBox(
        width: 300.w,
        height: 320.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isUsa
                ? [
                    Obx(() => SwitchListTile(
                          title: const Text("16 Hour Short Haul"),
                          value: controller.is16HourShortHaulEnabled.value,
                          onChanged: controller.toggle16HourShortHaul,
                        )),
                    Obx(() => SwitchListTile(
                          title: const Text("Adverse Driving"),
                          value: controller.isAdverseDrivingUSAEnabled.value,
                          onChanged: controller.toggleAdverseDrivingUSA,
                        )),
                    Obx(() => SwitchListTile(
                          title: const Text("Agriculture"),
                          value: controller.isAgricultureEnabled.value,
                          onChanged: controller.toggleAgriculture,
                        )),
                  ]
                : [
                    Obx(() => SwitchListTile(
                          title: const Text("Adverse Driving Condition"),
                          value: controller.isAdverseDrivingCanadaEnabled.value,
                          onChanged: controller.toggleAdverseDrivingCanada,
                        )),
                    Obx(() => SwitchListTile(
                          title: const Text("Deferral of Daily Off-Duty"),
                          value: controller.isDeferralOffDutyEnabled.value,
                          onChanged: controller.toggleDeferralOffDuty,
                        )),
                  ],
          ),
        ),
      ),
      confirm:
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
    );
  }

  // 🔌 OBD Dialog
  void _showObdDialog(BuildContext context, SettingsController controller) {
    Get.defaultDialog(
      title: "OBD Troubleshooting",
      content: SizedBox(
        width: 300.w,
        height: 320.h,
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: controller.scanForObd,
              icon: const Icon(Icons.bluetooth_searching),
              label: const Text("Scan for Devices"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() {
                if (controller.isScanningObd.value)
                  return const Center(child: CircularProgressIndicator());
                if (controller.availableObdDevices.isEmpty)
                  return const Center(child: Text("No devices found"));
                return ListView.builder(
                  itemCount: controller.availableObdDevices.length,
                  itemBuilder: (ctx, i) {
                    final device = controller.availableObdDevices[i];
                    return ListTile(
                      leading: const Icon(Icons.directions_car),
                      title: Text(device),
                      trailing: ElevatedButton(
                        onPressed: () => controller.connectToObd(device),
                        child: const Text("Connect"),
                      ),
                    );
                  },
                );
              }),
            ),
            const Divider(),
            Obx(() => Text(
                "Status: ${controller.connectedObdDevice.value.isEmpty ? 'Disconnected' : 'Connected to ${controller.connectedObdDevice.value}'}")),
          ],
        ),
      ),
      confirm:
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
    );
  }
}
