import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_api/controllers/mainnav_controller.dart';
import 'package:implementation_api/controllers/notification_controller.dart';
import 'package:implementation_api/pages/car_page.dart';
import 'package:implementation_api/pages/home_page.dart';
import 'package:implementation_api/pages/premier_page.dart';
import 'package:implementation_api/pages/profile_page.dart';

class MainnavPage extends StatelessWidget {
  MainnavPage({super.key});

  final controller = Get.find<MainnavController>();
  final fcm = Get.find<NotificationController>();

  final pages = [HomePage(), CarPage(), PremierPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              // () => Card(
              //   elevation: 2,
              //   child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           "📩 Last message received",
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(height: 6),
              //         Text(fcm.lastMessage.value),
              //         const Divider(height: 18),
              //         const Text(
              //           "📱 Your FCM Token",
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(height: 6),
              //         SelectableText(
              //           fcm.token.value,
              //           style: const TextStyle(fontSize: 12),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
            Expanded(child: pages[controller.selectedIndex.value]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add_home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_rounded),
              label: "Cars",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_rounded),
              label: "Premier",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
