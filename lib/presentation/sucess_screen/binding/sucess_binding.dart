import 'package:earlybeez_task/presentation/sucess_screen/controller/sucess_controller.dart';
import 'package:get/get.dart';

class SucessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SucessController());
  }
}
