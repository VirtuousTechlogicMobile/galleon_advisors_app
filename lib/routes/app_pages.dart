import 'package:galleon_advisors_app/modules/create_dual_study/bindings/create_dual_study_binding.dart';
import 'package:galleon_advisors_app/modules/create_dual_study/view/create_dual_study_screen.dart';
import 'package:galleon_advisors_app/modules/create_new_study/bindings/create_new_study_binding.dart';
import 'package:galleon_advisors_app/modules/create_new_study/view/create_new_study_screen.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/bindings/end_study_summary_binding.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/view/end_study_summary_screen.dart';
import 'package:galleon_advisors_app/modules/home/bindings/home_binding.dart';
import 'package:galleon_advisors_app/modules/home/view/home_screen.dart';
import 'package:galleon_advisors_app/modules/login/view/login_screen.dart';
import 'package:galleon_advisors_app/modules/manage_studies/bindings/manage_studies_binding.dart';
import 'package:galleon_advisors_app/modules/manage_studies/view/manage_studies_screen.dart';
import 'package:galleon_advisors_app/modules/study_screen/bindings/study_screen_binding.dart';
import 'package:galleon_advisors_app/modules/study_screen/view/study_screen.dart';
import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.noTransition;
  static final pages = [
    GetPage(
      name: _Routes.login,
      page: LoginScreen.new,
      binding: LoginBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    GetPage(
      name: _Routes.home,
      page: HomeScreen.new,
      binding: HomeScreenBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    GetPage(
      name: _Routes.manageStudies,
      page: ManageStudiesScreen.new,
      binding: ManageStudiesBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.createNewStudy,
      page: CreateNewStudyScreen.new,
      binding: CreateNewStudyBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.study,
      page: StudyScreen.new,
      binding: StudyScreenBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.endStudySummary,
      page: EndStudySummaryScreen.new,
      binding: EndStudySummaryBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.createDualStudy,
      page: CreateDualStudyScreen.new,
      binding: CreateDualStudyBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
    /*   /// Chats
    GetPage(
      name: _Routes.chatDetails,
      page: P2PChatView.new,
      binding: SingleChatBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),*/

    /// ------------------------------------------------------------------------
  ];

  static var transitionDuration = const Duration(milliseconds: 500);
}
