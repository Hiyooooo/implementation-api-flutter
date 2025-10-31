import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final lastMessage = 'Waiting for messages...'.obs;
  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
  }

  Future<void> _initFCM() async {
    final settings = await _messaging.requestPermission();

    token.value = await _messaging.getToken() ?? 'No token';

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'No title';
      final body = message.notification?.body ?? 'No body';
      lastMessage.value = '$title\n$body';

      Get.snackbar(title, body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'No title';
      lastMessage.value = 'Opened: $title';
    });
  }
}
