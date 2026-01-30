abstract class AppRoutes {
  AppRoutes._();
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const ASSIGNMENT = _Paths.ASSIGNMENT;
  static const SELECT_VEHICLE = _Paths.SELECT_VEHICLE;
  static const SELECT_TRAILER = _Paths.SELECT_TRAILER;
  static const ENTER_TRAILER = _Paths.ENTER_TRAILER;
  static const SELECT_SHIPPING = _Paths.SELECT_SHIPPING;
  static const ENTER_SHIPPING = _Paths.ENTER_SHIPPING;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const ASSIGNMENT = '/assignment';
  static const SELECT_VEHICLE = '/assignment/select-vehicle';
  static const SELECT_TRAILER = '/assignment/select-trailer';
  static const ENTER_TRAILER = '/assignment/enter-trailer';
  static const SELECT_SHIPPING = '/assignment/select-shipping';
  static const ENTER_SHIPPING = '/assignment/enter-shipping';
  static const SPLASH = '/splash';
}
