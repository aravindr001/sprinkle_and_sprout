

import 'package:get/get.dart';

class IndexController extends GetxController{

  var index = 0.obs;

  void change(int value){
    index.value = value;
  }
}