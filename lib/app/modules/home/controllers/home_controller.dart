import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/duty_status.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_dialog_box.dart';
import '../../../services/driver_service.dart';

class HomeController extends GetxController {
  final DriverService _driverService =
      Get.find<DriverService>(); // Injected Service

  // State from original HomeScreen & DriverProvider
  final currentStatus = Rx<DutyStatus>(DutyStatus.offDuty);
  final selectedNote = "No note".obs;
  final currentIndex = 0.obs;

  // Driver Info
  Rx<DriverProfile?> get currentDriver => _driverService.currentDriver;

  // Auth & Co-Driver State
  final isCoDriverLoggedIn = true.obs; // Mocked as true for testing UI

  // Real State from original code
  final vehicleNumber = "01".obs;
  final trailers = <String>[].obs;

  // Text Controllers
  final vehicleController = TextEditingController();
  final trailerController = TextEditingController();

  // Timer simulation (from original UI "14:00 REMAINING")
  // In a real app this would be a timer logic
  final remainingTime = "14:00".obs;

  @override
  void onInit() {
    super.onInit();
    vehicleController.text = vehicleNumber.value;
  }

  @override
  void onClose() {
    vehicleController.dispose();
    trailerController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void updateStatus(DutyStatus status) {
    currentStatus.value = status;
  }

  void updateNote(String note) {
    selectedNote.value = note;
  }

  void updateVehicle() {
    vehicleNumber.value = vehicleController.text;
    Get.back(); // Close bottom sheet
  }

  void addTrailer() {
    if (trailerController.text.isNotEmpty) {
      trailers.add(trailerController.text);
      trailerController.clear();
      update(); // Force update if needed, though trailers is observable
    }
  }

  Color getStatusColor(DutyStatus status) {
    switch (status) {
      case DutyStatus.offDuty:
        return Colors.red;
      case DutyStatus.sleeper:
        return Colors.blue;
      case DutyStatus.onDuty:
        return Colors.green;
      case DutyStatus.driving:
        return Colors.grey;
      case DutyStatus.yard:
        return Colors.orange;
      case DutyStatus.personal:
        return Colors.purple;
    }
    // Default return for lint safety, though switch covers all enum values usually
    return Colors.grey;
  }

  void logout() {
    Get.dialog(
      CustomDialogBox(
        title: "Logout",
        descriptions: "Are you sure you want to logout?",
        img: Icon(Icons.logout,
            size: 50, color: Colors.blue), // Placeholder or use asset
        positiveString: "Logout",
        negativeString: "Cancel",
        positiveClick: () {
          Get.back(); // Close dialog
          Get.offAllNamed('/auth/login'); // Or AppRoutes.LOGIN
          Get.snackbar("Logged Out", "You have been successfully logged out.");
        },
        negativeClick: () {
          Get.back(); // Close dialog
        },
      ),
    );
  }

  void switchDriver() {
    if (!isCoDriverLoggedIn.value) return;

    // Swap driver logic would go here
    Get.snackbar("Switch Driver", "Switched to Co-Driver context");
    // Toggle for demo/testing purposes
    // isCoDriverLoggedIn.value = !isCoDriverLoggedIn.value;
  }
}
