import 'package:get/get.dart';
import 'package:implementation_api/controllers/auth_controller.dart';
import 'package:implementation_api/controllers/mainnav_controller.dart';
import 'package:implementation_api/controllers/notification_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainnavController>(() => MainnavController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
