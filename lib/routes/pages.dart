import 'package:get/get.dart';
import 'package:implementation_api/bindings/app_binding.dart';
import 'package:implementation_api/bindings/splashscreen_binding.dart';
import 'package:implementation_api/pages/login_page.dart';
import 'package:implementation_api/pages/mainnav_page.dart';
import 'package:implementation_api/pages/premier_page.dart';
import 'package:implementation_api/pages/splashscreen_page.dart';
import 'package:implementation_api/routes/routes.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRouter.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRouter.loginpage,
      page: () => LoginPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.mainnav,
      page: () => MainnavPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.premierpage,
      page: () => PremierPage(),
      binding: AppBinding(),
    ),
  ];
}
