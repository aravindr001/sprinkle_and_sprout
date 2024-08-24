import 'package:get/get.dart';

class PieController extends GetxController {
  var index = true.obs;
  Map<String, double> dataMap = {
    "Chores": 5,
    "Personal Hygine": 3,
    "Gardening": 2,
  };
  Map<String, double> dataMap2 = {
    "Cooking": 5,
    "Bus": 3,
    "Waste Burning": 2,
  };



  void change(bool value) {
    index.value = value;
  }


}
