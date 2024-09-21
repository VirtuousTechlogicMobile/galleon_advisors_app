import 'package:galleon_advisors_app/modules/home/bindings/home_binding.dart';
import 'package:galleon_advisors_app/modules/home/view/home_screen.dart';
import 'package:galleon_advisors_app/modules/login/bindings/login_binding.dart';
import 'package:galleon_advisors_app/modules/login/view/login_screen.dart';
import 'package:galleon_advisors_app/modules/manage_studies/bindings/manage_studies_binding.dart';
import 'package:galleon_advisors_app/modules/manage_studies/view/manage_studies_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.noTransition;
  static final pages = [
    GetPage(
      name: _Routes.login,
      page: LoginScreen.new,
      binding: LoginController(),
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
