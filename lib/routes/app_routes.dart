import 'package:earlybeez_task/presentation/match_animal_screen/binding/animal_match_binding.dart';
import 'package:earlybeez_task/presentation/match_animal_screen/match_animal.dart';
import 'package:earlybeez_task/presentation/splash_screen/binding/splash_binding.dart';
import 'package:earlybeez_task/presentation/splash_screen/splash_screen.dart';
import 'package:earlybeez_task/presentation/sucess_screen/binding/sucess_binding.dart';
import 'package:earlybeez_task/presentation/sucess_screen/sucess_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String animalMatch = '/animal';
  static const String splashScreen = '/splash';
  static const String sucessScreen = '/sucess';

  static final pages = [
    GetPage(
      name: animalMatch,
      page: () => AnimalMatchScreen(),
      binding: AnimalMatchBinding(),
    ),
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: sucessScreen,
      page: () => const SucessScreenScreen(),
      binding: SucessBinding(),
    ),
  ];
}
