import 'package:earlybeez_task/presentation/match_animal_screen/controller/match_animal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalMatchScreen extends GetWidget<AnimalMatchController> {
  const AnimalMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: screensize.height * 0.7,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 180, 196),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "title".tr,
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 44, 76),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        "Questions 1 / 6 ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 146, 133, 133),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          controller.selectedAnimal.imagePath,
                          height: screensize.height * 0.35,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Target boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.selectedAnimalLetters.length,
                          (index) {
                            controller.selectedAnimalLetters[index];
                            return DragTarget<String>(
                              onAcceptWithDetails: (details) {
                                controller.dropLetter(index, details.data);
                              },
                              builder: (context, candidateData, rejectedData) {
                                final letter =
                                    controller.selectedAnimalLetters[index];
                                return Container(
                                  width: 50,
                                  height: 50,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: /*letter == ""
                                        ? Colors.green
                                        : */
                                        controller.shuffledColors[index],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    letter.toUpperCase(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.shuffledLetters.map((letter) {
                  return Draggable<String>(
                    data: letter,
                    feedback: Material(
                      color: Colors.transparent,
                      child: buildLetterTile(letter),
                    ),
                    child: buildLetterTile(letter),
                    childWhenDragging: buildLetterTile('', faded: true),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildLetterTile(String letter, {bool faded = false}) {
  return Container(
    width: 70,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: faded ? Colors.grey[300] : Colors.blue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      letter.toUpperCase(),
      style: const TextStyle(fontSize: 22, color: Colors.white),
    ),
  );
}
