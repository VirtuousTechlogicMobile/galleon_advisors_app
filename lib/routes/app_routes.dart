part of 'app_pages.dart';

abstract class AppRoutes {
  static const login = _Routes.login;
  static const home = _Routes.home;
  static const manageStudies = _Routes.manageStudies;
}

abstract class _Routes {
  static const login = '/login';
  static const home = '/home';
  static const manageStudies = '/manage_studies';
}
