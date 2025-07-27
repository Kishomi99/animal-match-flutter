import 'package:earlybeez_task/constants/image_constant.dart';
import 'package:earlybeez_task/presentation/sucess_screen/controller/sucess_controller.dart';
import 'package:earlybeez_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SucessScreenScreen extends GetWidget<SucessController> {
  const SucessScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            height: screenHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "congratulations".tr,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 223, 88, 133),
                  ),
                ),
                Lottie.asset(
                  ImageConstant.successAnimation,
                  height: screenHeight * 0.4,
                ),
                Text("win".tr,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 44, 76),
                    )),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.animalMatch);
                  },
                  child: Text(
                    "back".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 44, 76),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 223, 88, 133),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
