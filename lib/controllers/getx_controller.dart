import 'package:get/get.dart';

class ColorController extends GetxController {
  final selectedIndex = 0.obs;

  void setIndex(int index) {
    selectedIndex.value = 0;
  }
}


