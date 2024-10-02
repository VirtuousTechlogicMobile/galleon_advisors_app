part of 'app_pages.dart';

abstract class AppRoutes {
  static const login = _Routes.login;
  static const home = _Routes.home;
  static const manageStudies = _Routes.manageStudies;
  static const createNewStudy = _Routes.createNewStudy;
  static const study = _Routes.study;
  static const endStudySummary = _Routes.endStudySummary;
  static const createDualStudy = _Routes.createDualStudy;
  static const managePositions = _Routes.managePositions;
  static const managePositionsDetail = _Routes.managePositionsDetail;
  static const createNewPosition = _Routes.createNewPosition;
  static const createPositionAddServiceAndOpp = _Routes.createPositionAddServiceAndOpp;
}

abstract class _Routes {
  static const login = '/login';
  static const home = '/home';
  static const manageStudies = '/manage_studies';
  static const createNewStudy = '/create-new-study';
  static const study = '/study';
  static const endStudySummary = '/study-endStudy';
  static const createDualStudy = '/create-dual-study';
  static const managePositions = '/manage-positions';
  static const managePositionsDetail = '/position-detail';
  static const createNewPosition = '/create-position';
  static const createPositionAddServiceAndOpp = '/create-position-add-service-opportunities';
}
