import 'package:earlybeez_task/presentation/match_animal_screen/controller/match_animal_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashScreen.
///
/// This class ensures that the SplashController is created when the
/// SplashScreen is first loaded.
class AnimalMatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimalMatchController());
  }
}
