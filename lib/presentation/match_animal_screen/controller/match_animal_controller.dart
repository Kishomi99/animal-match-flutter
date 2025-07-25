import 'package:earlybeez_task/constants/image_constant.dart';
import 'package:earlybeez_task/presentation/match_animal_screen/model/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalMatchController extends GetxController {
  List<Animal> animals = [
    Animal(name: 'monkey', imagePath: ImageConstant.monkey),
    Animal(name: 'horse', imagePath: ImageConstant.horse),
    Animal(name: 'parrot', imagePath: ImageConstant.parrot),
    Animal(name: 'panda', imagePath: ImageConstant.panda),
    // Add more animals here
  ];

  List<Color> colors = [
    Color.fromARGB(255, 238, 147, 140),
    Color.fromARGB(255, 163, 227, 165),
    Color.fromARGB(255, 138, 186, 225),
    Color.fromARGB(255, 235, 223, 112),
    Color.fromARGB(255, 222, 166, 82),
    const Color.fromARGB(255, 210, 118, 226),
    const Color.fromARGB(255, 237, 130, 165),
    const Color.fromARGB(255, 139, 221, 232),
    const Color.fromARGB(255, 243, 171, 145),
    Colors.grey,
    const Color.fromARGB(255, 160, 228, 221),
  ];

  late List<Animal> random;
  late Animal selectedAnimal;
  late List<String> shuffledLetters;
  late List<String> selectedAnimalLetters;
  String droppedWord = '';
  late List<Color> shuffledColors;

  @override
  void onInit() {
    super.onInit();
    random = List<Animal>.from(animals)..shuffle();
    selectedAnimal = random.first;
    selectedAnimalLetters = selectedAnimal.name.split('');
    shuffledLetters = selectedAnimal.name.split('')..shuffle();
    shuffledColors = List<Color>.from(colors)..shuffle();

    print(selectedAnimal.name);
    print(selectedAnimalLetters);
  }

  void dropLetter(int index, String letter) {
    selectedAnimalLetters[index] = letter;
    //droppedLetters.refresh();

    if (!selectedAnimalLetters.contains('')) {
      final word = selectedAnimalLetters.join();
      if (word == selectedAnimal.name) {
        // showDialog(
        //   context: Get.context!,
        //   builder: (_) => const AlertDialog(
        //     title: Text('✅ Success'),
        //     content: Text('You matched the word correctly!'),
        //   ),
        //);
      } else {
        showDialog(
          context: Get.context!,
          builder: (_) => const AlertDialog(
            title: Text('❌ Try Again'),
            content: Text('That\'s not the correct word.'),
            backgroundColor: Color.fromARGB(255, 233, 105, 96),
          ),
        );
      }
    }
  }
}
