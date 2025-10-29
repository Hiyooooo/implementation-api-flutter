import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:implementation_api/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Loading...")));
  }
}
