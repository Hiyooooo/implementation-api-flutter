import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:implementation_api/controllers/auth_controller.dart';
import 'package:implementation_api/widgets/button_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
          text: "Logout",
          onPressed: () {
            controller.logout();
          },
        ),
      ),
    );
  }
}
