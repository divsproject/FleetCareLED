abstract class AppRoutes {
  AppRoutes._();
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const ASSIGNMENT = _Paths.ASSIGNMENT;
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
  static const SPLASH = '/splash';
}
