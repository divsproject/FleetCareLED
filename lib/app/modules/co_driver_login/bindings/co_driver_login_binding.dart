import 'package:get/get.dart';
import '../controllers/co_driver_login_controller.dart';

class CoDriverLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoDriverLoginController>(
      () => CoDriverLoginController(),
    );
  }
}
