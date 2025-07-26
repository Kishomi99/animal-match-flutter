import 'package:earlybeez_task/constants/image_constant.dart';
import 'package:earlybeez_task/presentation/sucess_screen/controller/sucess_controller.dart';
import 'package:earlybeez_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessScreenScreen extends GetWidget<SucessController> {
  const SucessScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  ImageConstant.win,
                  fit: BoxFit.cover,
                  height: 350,
                  width: 300,
                ),
              ),
              const SizedBox(height: 20),
              Text("win".tr,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 44, 76),
                  )),
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
      backgroundColor: Colors.white,
    );
  }
}
