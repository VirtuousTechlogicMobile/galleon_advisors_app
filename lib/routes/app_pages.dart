import 'package:galleon_advisors_app/modules/login/bindings/login_binding.dart';
import 'package:galleon_advisors_app/modules/login/view/login_screen.dart';
import 'package:get/get.dart';
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
