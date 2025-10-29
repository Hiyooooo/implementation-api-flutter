import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_api/controllers/mainnav_controller.dart';
import 'package:implementation_api/pages/car_page.dart';
import 'package:implementation_api/pages/home_page.dart';
import 'package:implementation_api/pages/profile_page.dart';

class MainnavPage extends StatelessWidget {
  MainnavPage({super.key});

  final controller = Get.find<MainnavController>();

  final pages = [HomePage(), CarPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add_home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_rounded),
              label: "Cars",
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
