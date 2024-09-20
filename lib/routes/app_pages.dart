import 'package:galleon_advisors_app/modules/welcome/welcome_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.noTransition;
  static final pages = [
    GetPage(
      name: _Routes.welcome,
      page: WelcomeView.new,
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
