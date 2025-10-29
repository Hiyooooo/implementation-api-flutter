import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_api/controllers/auth_controller.dart';
import 'package:implementation_api/widgets/button_widget.dart';
import 'package:implementation_api/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 18),
                  Image.asset('assets/images/logo.png', height: 50),
                  const SizedBox(height: 20),

                  AppTextField(
                    label: "Username",
                    prefixIcon: Icon(Icons.person_rounded),
                    controller: controller.username,
                  ),

                  const SizedBox(height: 16),
                  Obx(
                    () => AppTextField(
                      label: "Password",
                      prefixIcon: Icon(Icons.lock_rounded),
                      controller: controller.password,
                      obscureText: controller.isPasswordVisible.value
                          ? false
                          : true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                        onPressed: () => controller.isPasswordVisible.value =
                            controller.isPasswordVisible.value ? false : true,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : AppButton(
                            text: "Login",
                            onPressed: () {
                              controller.login();
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
