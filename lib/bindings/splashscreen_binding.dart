import 'package:get/get.dart';
import 'package:implementation_api/controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
