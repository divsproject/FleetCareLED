import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AssignmentController extends GetxController {
  // Observable variables
  final selectedVehicle = Rxn<String>();
  final selectedTrailer = Rxn<String>();
  final shippingIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void navigateToSelectVehicle() {
    // TODO: Implement SelectVehicleScreen migration
    // Get.toNamed(AppRoutes.SELECT_VEHICLE);
    Get.snackbar('Navigation', 'Select Vehicle Screen not migrated yet');
  }

  void navigateToEnterTrailer() {
    // TODO: Implement EnterTrailerScreen migration
    // Get.toNamed(AppRoutes.ENTER_TRAILER);
    Get.snackbar('Navigation', 'Enter Trailer Screen not migrated yet');
  }

  void navigateToAddShippingId() {
    // TODO: Implement AddShippingIdScreen migration
    // Get.toNamed(AppRoutes.ADD_SHIPPING_ID);
    Get.snackbar('Navigation', 'Add Shipping ID Screen not migrated yet');
  }

  void completeAssignment() {
    // Logic to save assignment
    Get.offAllNamed(AppRoutes.HOME);
  }
}
