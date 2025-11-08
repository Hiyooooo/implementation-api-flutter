import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_api/models/table_model.dart';
import 'package:http/http.dart' as http;
import 'package:implementation_api/network/api_config.dart';

class PremierController extends GetxController {
  var isloading = false.obs;
  var standings = <TableStanding>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPremierTable();
  }

  void fetchPremierTable() async {
    try {
      isloading.value = true;
      final res = await http.post(
        Uri.parse(
          "${ApiConfig.baseURLV1}/v1/json/3/lookuptable.php?l=4328&s=2025-2026",
        ),
      );
      print("status code: " + res.statusCode.toString());
      print("status code: " + res.statusCode.toString());
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List standingData = data['table'];
        standings.assignAll(
          standingData.map((e) => TableStanding.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          "Error",
          "Status: (${res.statusCode})",
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    isloading.value = false;
  }
}
