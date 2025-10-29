import 'package:get/get.dart';

class MainnavController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(index) {
    selectedIndex.value = index;
  }
}
