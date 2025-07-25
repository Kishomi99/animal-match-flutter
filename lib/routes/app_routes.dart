import 'package:earlybeez_task/presentation/match_animal_screen/binding/animal_match_binding.dart';
import 'package:earlybeez_task/presentation/match_animal_screen/match_animal.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String animalMatch = '/animal';

  static final pages = [
    GetPage(
        name: animalMatch,
        page: () => AnimalMatchScreen(),
        binding: AnimalMatchBinding()),
  ];
}
