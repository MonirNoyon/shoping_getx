
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  static BottomNavBarController instance = Get.find();

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}