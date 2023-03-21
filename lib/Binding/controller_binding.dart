import 'package:flutter_signin_example/Controller/word_controller.dart';
import 'package:get/get.dart';
class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<WordController>(WordController());
  }

}