import 'package:earlybeez_task/constants/image_constant.dart';
import 'package:earlybeez_task/presentation/match_animal_screen/model/animal_model.dart';
import 'package:earlybeez_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalMatchController extends GetxController {
  List<Animal> animals = [
    Animal(name: 'குரங்கு', imagePath: ImageConstant.monkey),
    Animal(name: 'குதிரை', imagePath: ImageConstant.horse),
    Animal(name: 'கிளி', imagePath: ImageConstant.parrot),
    Animal(name: 'மயில்', imagePath: ImageConstant.peacock),
    Animal(name: 'பாண்டா', imagePath: ImageConstant.panda),
    Animal(name: 'ஆமை', imagePath: ImageConstant.turtle),
    Animal(name: 'கழுதை', imagePath: ImageConstant.donkey),
    Animal(name: 'முயல்', imagePath: ImageConstant.rabbit),
    Animal(name: 'நாய்', imagePath: ImageConstant.dog),
    Animal(
        name: 'monkey', tamilName: 'குரங்கு', imagePath: ImageConstant.monkey),
    Animal(name: 'horse', tamilName: 'குதிரை', imagePath: ImageConstant.horse),
    Animal(name: 'parrot', tamilName: 'கிளி', imagePath: ImageConstant.parrot),
    Animal(
        name: 'peacock', tamilName: 'மயில்', imagePath: ImageConstant.peacock),
    Animal(name: 'panda', tamilName: 'பாண்டா', imagePath: ImageConstant.panda),
    Animal(name: 'turtle', tamilName: 'ஆமை', imagePath: ImageConstant.turtle),
    Animal(name: 'donkey', tamilName: 'கழுதை', imagePath: ImageConstant.donkey),
    Animal(name: 'rabbit', tamilName: 'முயல்', imagePath: ImageConstant.rabbit),
    Animal(name: 'dog', imagePath: ImageConstant.dog),
  ];

  List<Color> colors = [
    const Color.fromARGB(255, 238, 147, 140),
    const Color.fromARGB(255, 163, 227, 165),
    const Color.fromARGB(255, 138, 186, 225),
    const Color.fromARGB(255, 235, 223, 112),
    const Color.fromARGB(255, 222, 166, 82),
    const Color.fromARGB(255, 210, 118, 226),
    const Color.fromARGB(255, 237, 130, 165),
    const Color.fromARGB(255, 139, 221, 232),
    const Color.fromARGB(255, 243, 171, 145),
    Colors.grey,
    const Color.fromARGB(255, 160, 228, 221),
  ];
  List<String?> droppedLetters = [];

  RxList<Animal> random = <Animal>[].obs;
  late Animal selectedAnimal;
  late List<String> shuffledLetters;
  late List<String> selectedAnimalLetters;
  List<String> checkfullWord = [];
  late List<Color> shuffledColors;
  late List<Color> shuffledColors2;

  @override
  void onInit() {
    super.onInit();
    random.value = List<Animal>.from(animals)..shuffle();
    print(random.map((animal) => animal.name).toList());
    nextAnimal();
  }

  int currentIndex = 0;
  void nextAnimal() {
    if (currentIndex < 6) {
      //  print("Current Index: $currentIndex");
      selectedAnimal = random[currentIndex];
      selectedAnimalLetters = selectedAnimal.name.characters.toList();
      shuffledLetters = List<String>.from(selectedAnimalLetters)..shuffle();
      shuffledColors = List<Color>.from(colors)..shuffle();
      shuffledColors2 = List<Color>.from(colors)..shuffle();

      droppedLetters = List<String?>.filled(selectedAnimalLetters.length, null);
      update(); // refresh UI
    } else {
      Get.offAllNamed(AppRoutes.sucessScreen);
    }
  }

  void dropLetter(int index, String letter) {
    // print("$letter dropped at index $index");
    if (selectedAnimalLetters[index] == letter &&
        droppedLetters[index] == null) {
      droppedLetters[index] = letter;
      update();
      //  print("Current word: droppedLetters[index] = $droppedLetters");
      //  print(droppedLetters.join());
      if (droppedLetters.join() == selectedAnimal.name) {
        Get.defaultDialog(
          title: "✅ Correct!",
          content: const Text("Well done! Moving to the next animal..."),
          onConfirm: () {
            Get.back(); // Close dialog
            currentIndex++;
            nextAnimal();
          },
          textConfirm: "Next",
        );
      }

      update(); // refresh UI
    } else {
      showDialog(
        context: Get.context!,
        builder: (_) => const AlertDialog(
          title: Text('❌ Try Again'),
          content: Text('That\'s not the correct letter.'),
          backgroundColor: Color.fromARGB(255, 233, 105, 96),
        ),
      );
    }
  }
}
