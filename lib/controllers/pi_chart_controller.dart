import 'package:get/get.dart';

class PieController extends GetxController {
  var index = true.obs;
  var dataMap1 = {
    "Chores": 5,
    "Personal Hygine": 3,
    "Gardening": 2,
  };
  var dataMap2 = {
    "Chores": 5,
    "Personal Hygine": 3,
    "Gardening": 2,
  };
  var dataMap = <String, double>{};

  void change(bool value) {
    index.value = value;
    if (index.value) {
      dataMap = dataMap1.map((key, value) => MapEntry(key.toString(), value.toDouble()));
    } else {
      dataMap = dataMap2.map((key, value) => MapEntry(key.toString(), value.toDouble()));
    }
  }
}
