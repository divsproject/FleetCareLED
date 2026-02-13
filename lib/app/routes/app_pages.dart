import 'package:fleetcare_eld/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:fleetcare_eld/app/modules/dashboard/views/dashboard_view.dart';
import 'package:fleetcare_eld/app/modules/driver_switching/bindings/driver_switching_binding.dart';
import 'package:fleetcare_eld/app/modules/driver_switching/views/driver_switching_view.dart';
import 'package:fleetcare_eld/app/modules/dvir/bindings/dvir_binding.dart';
import 'package:fleetcare_eld/app/modules/dvir/views/create_dvir_view.dart';
import 'package:fleetcare_eld/app/modules/dvir/views/add_defect_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/views/access_code_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/bindings/dot_inspection_binding.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/views/dot_inspection_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/views/dot_inspection_detail_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/views/send_eld_data_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/views/send_logs_view.dart';
import 'package:fleetcare_eld/app/modules/dot_inspection/controllers/access_code_controller.dart';
import 'package:fleetcare_eld/app/modules/help/bindings/help_binding.dart';
import 'package:fleetcare_eld/app/modules/help/views/help_view.dart';
import 'package:fleetcare_eld/app/modules/logbook/bindings/logbook_binding.dart';
import 'package:fleetcare_eld/app/modules/logbook/views/logbook_view.dart';
import 'package:fleetcare_eld/app/modules/notification/bindings/notification_binding.dart';
import 'package:fleetcare_eld/app/modules/notification/views/notification_view.dart';
import 'package:fleetcare_eld/app/modules/settings/bindings/settings_binding.dart';
import 'package:fleetcare_eld/app/modules/settings/views/settings_view.dart';
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
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/hos/bindings/hours_of_service_binding.dart';
import '../modules/hos/views/hours_of_service_view.dart';
import '../modules/dvir/views/dvir_view.dart';
import '../modules/routes/views/routes_view.dart';
import '../modules/forms/views/forms_view.dart';
import '../modules/fueling/views/fueling_view.dart';
import '../modules/co_driver_login/bindings/co_driver_login_binding.dart';
import '../modules/co_driver_login/views/co_driver_login_view.dart';
import '../modules/daily_log/bindings/daily_log_binding.dart';
import '../modules/daily_log/views/daily_log_view.dart';
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
      binding: HoursOfServiceBinding(),
    ),
    GetPage(
      name: AppRoutes.DVIR,
      page: () => const DvirView(),
      binding: DvirBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATE_DVIR,
      page: () => const CreateDvirView(),
      binding: DvirBinding(),
    ),
    GetPage(
      name: AppRoutes.DRIVER_SWITCHING,
      page: () => const DriverSwitchingView(),
      binding: DriverSwitchingBinding(),
    ),
    GetPage(
      name: AppRoutes.ADD_DEFECT,
      page: () => const AddDefectView(),
      binding: DvirBinding(),
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
    GetPage(
      name: AppRoutes.DAILY_LOG,
      page: () => const DailyLogView(),
      binding: DailyLogBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.DOT_INSPECTION,
      page: () => const DotInspectionView(),
      binding: DotInspectionBinding(),
    ),
    GetPage(
      name: AppRoutes.DOT_INSPECTION_DETAIL,
      page: () => const DotInspectionDetailView(),
    ),
    GetPage(
      name: AppRoutes.ACCESS_CODE,
      page: () => const AccessCodeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AccessCodeController());
      }),
    ),
    GetPage(
      name: AppRoutes.SEND_ELD_DATA,
      page: () => const SendEldDataView(),
    ),
    GetPage(
      name: AppRoutes.SEND_LOGS,
      page: () => const SendLogsView(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
   GetPage(
      name: AppRoutes.LOGBOOK,
      page: () =>  LogbookView(),
      binding: LogbookBinding(),
    ),
  ];
}
