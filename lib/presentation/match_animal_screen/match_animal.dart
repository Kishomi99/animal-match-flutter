import 'package:earlybeez_task/presentation/match_animal_screen/controller/match_animal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalMatchScreen extends GetWidget<AnimalMatchController> {
  const AnimalMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 180, 196),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.05,
                      bottom: screenHeight * 0.02,
                      left: screenWidth * 0.02,
                      right: screenWidth * 0.02,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "title".tr,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 5, 44, 76),
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05),
                        ),
                        GetBuilder<AnimalMatchController>(
                          builder: (_) => Text(
                            "Questions  ${controller.currentIndex + 1} / 6 ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 146, 133, 133),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Center(
                            child: GetBuilder<AnimalMatchController>(
                          builder: (_) => Image.asset(
                            controller.selectedAnimal.imagePath,
                            height: screenHeight * 0.35,
                          ),
                        )),
                        SizedBox(height: screenHeight * 0.02),
                        // Target boxes
                        GetBuilder<AnimalMatchController>(
                          builder: (_) => Wrap(
                            spacing: 2,
                            runSpacing: 5,
                            children: List.generate(
                              controller.selectedAnimalLetters.length,
                              (index) {
                                final dropped =
                                    controller.droppedLetters[index];
                                //  print("object: dropped $dropped");
                                return DragTarget<String>(
                                  onAcceptWithDetails: (details) {
                                    controller.dropLetter(index, details.data);
                                  },
                                  builder:
                                      (context, candidateData, rejectedData) {
                                    final letter =
                                        controller.selectedAnimalLetters[index];
                                    return Container(
                                      width: screenWidth * 0.12,
                                      height: screenHeight * 0.07,
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
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                SizedBox(height: screenHeight * 0.03),
                GetBuilder<AnimalMatchController>(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.shuffledLetters.map((letter) {
                        final animal = controller.selectedAnimalLetters;
                        return Draggable<String>(
                          data: letter,
                          feedback: Material(
                            color: Colors.transparent,
                            child: buildLetterTile(
                              letter,
                              screenWidth * 0.15,
                              screenHeight * 0.08,
                              Colors.blue,
                            ),
                          ),
                          childWhenDragging: buildLetterTile(
                              '',
                              screenWidth * 0.15,
                              screenHeight * 0.08,
                              Colors.blue,
                              faded: true),
                          child: buildLetterTile(
                            letter,
                            screenWidth * 0.2,
                            screenHeight * 0.09,
                            controller.shuffledColors2[animal.indexOf(letter)],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLetterTile(String letter, double width, double height, Color? color,
    {bool faded = false}) {
  return Container(
    width: width,
    height: height,
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
