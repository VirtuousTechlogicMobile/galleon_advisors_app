part of 'app_pages.dart';

abstract class AppRoutes {
  static const login = _Routes.login;
  static const home = _Routes.home;
  static const manageStudies = _Routes.manageStudies;
  static const createNewStudy = _Routes.createNewStudy;
  static const study = _Routes.study;
  static const endStudySummary = _Routes.endStudySummary;
  static const createDualStudy = _Routes.createDualStudy;
}

abstract class _Routes {
  static const login = '/login';
  static const home = '/home';
  static const manageStudies = '/manage_studies';
  static const createNewStudy = '/create-new-study';
  static const study = '/study';
  static const endStudySummary = '/study-endStudy';
  static const createDualStudy = '/create-dual-study';
}
