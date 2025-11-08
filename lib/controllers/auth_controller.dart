import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:implementation_api/models/auth_model.dart';
import 'package:implementation_api/network/api_config.dart';
import 'package:implementation_api/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  var user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    ever(user, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    final target = user == null ? AppRouter.loginpage : AppRouter.mainnav;
    if (Get.currentRoute != target) {
      Get.offAllNamed(target);
    }
  }

  void login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Auth",
        "Username or password cannot be empty",
        backgroundColor: Colors.redAccent,
      );
      return;
    }

    try {
      isLoading.value = true;

      final res = await http.post(
        Uri.parse("${ApiConfig.baseURL}/latihan/login"),
        body: {"username": username.text, "password": password.text},
      );

      if (res.statusCode == 200) {
        final model = loginModelFromJson(res.body);

        if (model.status) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', model.token);

          Get.snackbar(
            "Auth",
            "Login Success",
            backgroundColor: Colors.greenAccent,
          );

          Get.offNamed(AppRouter.mainnav);
        } else {
          Get.snackbar(
            "Auth",
            model.message,
            backgroundColor: Colors.redAccent,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Failed Login, status: (${res.statusCode})",
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        e.toString(),
        backgroundColor: Colors.redAccent,
      );
    }
    isLoading.value = false;
  }

  void logout() async {
    Get.defaultDialog(
      title: "Confirm",
      middleText: "Are you sure want to logout?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        Get.offAllNamed(AppRouter.loginpage);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await auth.signOut();
  }
}
