import 'package:get/get.dart';

import '../modules/assignment/bindings/assignment_binding.dart';
import '../modules/assignment/views/assignment_view.dart';
import '../modules/assignment/views/select_vehicle_view.dart';
import '../modules/assignment/views/select_trailer_view.dart';
import '../modules/assignment/views/enter_trailer_view.dart';
import '../modules/assignment/views/select_shipping_view.dart';
import '../modules/assignment/views/enter_shipping_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/signup_view.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/hos/views/hours_of_service_view.dart';
import '../modules/dvir/views/dvir_view.dart';
import '../modules/routes/views/routes_view.dart';
import '../modules/forms/views/forms_view.dart';
import '../modules/fueling/views/fueling_view.dart';
import '../modules/co_driver_login/bindings/co_driver_login_binding.dart';
import '../modules/co_driver_login/views/co_driver_login_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(), // Reusing AuthBinding
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(), // Reusing AuthBinding
    ),
    GetPage(
      name: AppRoutes.ASSIGNMENT,
      page: () => const AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.SELECT_VEHICLE,
      page: () => const SelectVehicleView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.SELECT_TRAILER,
      page: () => const SelectTrailerView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.ENTER_TRAILER,
      page: () => const EnterTrailerView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.SELECT_SHIPPING,
      page: () => const SelectShippingView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.ENTER_SHIPPING,
      page: () => const EnterShippingView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOS,
      page: () => const HoursOfServiceView(),
    ),
    GetPage(
      name: AppRoutes.DVIR,
      page: () => const DvirView(),
    ),
    GetPage(
      name: AppRoutes.ROUTES,
      page: () => const RoutesView(),
    ),
    GetPage(
      name: AppRoutes.FORMS,
      page: () => const FormsView(),
    ),
    GetPage(
      name: AppRoutes.FUELING,
      page: () => const FuelingView(),
    ),
    GetPage(
      name: AppRoutes.CO_DRIVER_LOGIN,
      page: () => const CoDriverLoginView(),
      binding: CoDriverLoginBinding(),
    ),
  ];
}
