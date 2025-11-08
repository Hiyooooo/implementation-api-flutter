import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:implementation_api/controllers/premier_controller.dart';

class PremierPage extends StatelessWidget {
  PremierPage({super.key});

  final controller = Get.find<PremierController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isloading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchPremierTable();
            },
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge),
                    ),
                    title: Text(team.strTeam.toString()),
                    trailing: Text(team.intPoints),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
