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
                        style: const TextStyle(
                            color: Color.fromARGB(255, 5, 44, 76),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      GetBuilder<AnimalMatchController>(
                        builder: (_) => Text(
                          "Questions  ${controller.currentIndex + 1} / 6 ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 133, 133),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),

                      SizedBox(height: 20),
                      Center(
                          child: GetBuilder<AnimalMatchController>(
                        builder: (_) => Image.asset(
                          controller.selectedAnimal.imagePath,
                          height: screensize.height * 0.35,
                        ),
                      )),
                      SizedBox(height: 20),
                      // Target boxes
                      GetBuilder<AnimalMatchController>(
                        builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.selectedAnimalLetters.length,
                            (index) {
                              final dropped = controller.droppedLetters[index];
                              print("object: dropped $dropped");
                              return DragTarget<String>(
                                onAcceptWithDetails: (details) {
                                  controller.dropLetter(index, details.data);
                                },
                                builder:
                                    (context, candidateData, rejectedData) {
                                  final letter =
                                      controller.selectedAnimalLetters[index];
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: letter == dropped
                                          ? Colors.green
                                          : controller.shuffledColors[index],
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
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<AnimalMatchController>(
                builder: (_) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.shuffledLetters.map((letter) {
                      return Draggable<String>(
                        data: letter,
                        feedback: Material(
                          color: Colors.transparent,
                          child: buildLetterTile(
                            letter,
                            Colors.blue,
                          ),
                        ),
                        child: buildLetterTile(
                          letter,
                          controller.shuffledColors[
                              controller.shuffledLetters.indexOf(letter) + 5],
                        ),
                        childWhenDragging:
                            buildLetterTile('', Colors.blue, faded: true),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildLetterTile(String letter, Color? color, {bool faded = false}) {
  return Container(
    width: 70,
    height: 70,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: faded ? Colors.grey[300] : color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      letter.toUpperCase(),
      style: const TextStyle(fontSize: 22, color: Colors.white),
    ),
  );
}
