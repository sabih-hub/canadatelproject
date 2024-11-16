import 'package:get/get.dart';
import 'package:testproject/Controllers/enter_Pin_Controller.dart';
import 'package:testproject/Controllers/home_screen_controller.dart';


class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => EnterPinController(), fenix: true);
  }
}