import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AssignmentController extends GetxController {
  // Observable variables
  // 🔹 DATA & STATE
  final selectedVehicle = "305".obs;
  final List<String> otherVehicles = [
    "302",
    "303",
    "304",
    "305",
    "306",
    "307",
    "308"
  ];

  final selectedTrailers = <String>{"TR-101A"}.obs;
  final List<String> trailers = [
    "TR-101A",
    "TR-102B",
    "TR-103C",
    "TR-104D",
    "TR-105E"
  ];

  final selectedShippingIds = <String>{"SHIP-12045"}.obs;
  final List<String> shippingIds = [
    "SHIP-12045",
    "SHIP-12046",
    "SHIP-12047",
    "SHIP-12048",
    "SHIP-12049"
  ];

  @override
  void onInit() {
    super.onInit();
  }

  // 🔹 ACTIONS
  void setSelectedVehicle(String vehicle) {
    selectedVehicle.value = vehicle;
    update(); // For GetBuilder
  }

  void toggleTrailer(String trailer) {
    if (selectedTrailers.contains(trailer)) {
      selectedTrailers.remove(trailer);
    } else {
      selectedTrailers.add(trailer);
    }
    update();
  }

  void toggleShippingId(String id) {
    if (selectedShippingIds.contains(id)) {
      selectedShippingIds.remove(id);
    } else {
      selectedShippingIds.add(id);
    }
    update();
  }

  void navigateToSelectVehicle() {
    Get.toNamed(AppRoutes.SELECT_VEHICLE);
  }

  void navigateToEnterTrailer() {
    Get.toNamed(AppRoutes.SELECT_TRAILER);
  }

  void navigateToAddShippingId() {
    Get.toNamed(AppRoutes.SELECT_SHIPPING);
  }

  void navigateToManualTrailer() {
    Get.toNamed(AppRoutes.ENTER_TRAILER);
  }

  void navigateToManualShipping() {
    Get.toNamed(AppRoutes.ENTER_SHIPPING);
  }

  void completeAssignment() {
    // Save logic here
    Get.offAllNamed(AppRoutes.HOME);
  }
}
