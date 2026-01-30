import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/duty_status.dart';
import '../../../core/values/app_colors.dart';

class HomeController extends GetxController {
  // State from original HomeScreen & DriverProvider
  final currentStatus = Rx<DutyStatus>(DutyStatus.offDuty);
  final selectedNote = "No note".obs;
  final showQuickActions = false.obs;
  final currentIndex = 0.obs;

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

  void toggleQuickActions() {
    showQuickActions.value = !showQuickActions.value;
  }

  void closeQuickActions() {
    showQuickActions.value = false;
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
}
