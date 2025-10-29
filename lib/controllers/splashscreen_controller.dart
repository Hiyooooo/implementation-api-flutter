import 'package:get/get.dart';
import 'package:implementation_api/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      Get.offAllNamed(AppRouter.loginpage);
    } else {
      Get.offAllNamed(AppRouter.mainnav);
    }
  }
}
