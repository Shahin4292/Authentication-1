import 'package:authentication/res/routes/routes_name.dart';
import 'package:get/get.dart';


import '../../view/login_screen/login_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
