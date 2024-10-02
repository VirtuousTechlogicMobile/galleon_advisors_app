import 'package:galleon_advisors_app/modules/create_dual_study/bindings/create_dual_study_binding.dart';
import 'package:galleon_advisors_app/modules/create_dual_study/view/create_dual_study_screen.dart';
import 'package:galleon_advisors_app/modules/create_new_position/bindings/create_new_position_binding.dart';
import 'package:galleon_advisors_app/modules/create_new_position/view/create_new_position_screen.dart';
import 'package:galleon_advisors_app/modules/create_new_study/bindings/create_new_study_binding.dart';
import 'package:galleon_advisors_app/modules/create_new_study/view/create_new_study_screen.dart';
import 'package:galleon_advisors_app/modules/create_position_add_opp_and_service/bindings/create_position_add_opp_and_service_binding.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/bindings/end_study_summary_binding.dart';
import 'package:galleon_advisors_app/modules/end_study_summary/view/end_study_summary_screen.dart';
import 'package:galleon_advisors_app/modules/home/bindings/home_binding.dart';
import 'package:galleon_advisors_app/modules/home/view/home_screen.dart';
import 'package:galleon_advisors_app/modules/login/view/login_screen.dart';
import 'package:galleon_advisors_app/modules/manage_position_detail/bindings/manage_position_detail_binding.dart';
import 'package:galleon_advisors_app/modules/manage_position_detail/view/manage_position_detail_screen.dart';
import 'package:galleon_advisors_app/modules/manage_positions/bindings/manage_positions_binding.dart';
import 'package:galleon_advisors_app/modules/manage_positions/view/manage_positions_screen.dart';
import 'package:galleon_advisors_app/modules/manage_studies/bindings/manage_studies_binding.dart';
import 'package:galleon_advisors_app/modules/manage_studies/view/manage_studies_screen.dart';
import 'package:galleon_advisors_app/modules/study_screen/bindings/study_screen_binding.dart';
import 'package:galleon_advisors_app/modules/study_screen/view/study_screen.dart';
import 'package:get/get.dart';

import '../modules/create_position_add_opp_and_service/view/create_position_add_opp_and_service_screen.dart';
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
      page: () => EndStudySummaryScreen(studyId: Get.parameters['studyId'] ?? ''),
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

    GetPage(
      name: _Routes.managePositions,
      page: ManagePositionsScreen.new,
      binding: ManagePositionsBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.managePositionsDetail,
      page: () => ManagePositionDetailScreen(positionId: Get.parameters['positionId'] ?? ''),
      binding: ManagePositionDetailBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.createNewPosition,
      page: CreateNewPositionScreen.new,
      binding: CreateNewPositionBinding(),
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),

    GetPage(
      name: _Routes.createPositionAddServiceAndOpp,
      page: CreatePositionAddOppAndServiceScreen.new,
      binding: CreatePositionAddOppAndServiceBinding(),
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
