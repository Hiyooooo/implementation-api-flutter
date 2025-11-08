import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:implementation_api/controllers/auth_controller.dart';
import 'package:implementation_api/widgets/button_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Obx(() {
        // Jika login dengan Google, user email tersedia
        final user = controller.user.value;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Foto profile (jika login Google)
              CircleAvatar(
                radius: 50,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : null,
                child: user?.photoURL == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 20),

              // Nama / username
              Text(
                user?.displayName ?? "Tidak ada nama",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Email
              Text(
                user?.email ?? "Tidak ada email",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Logout",
                onPressed: () {
                  controller.signOut();
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
