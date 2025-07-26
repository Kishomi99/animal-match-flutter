import 'package:earlybeez_task/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Image.asset(
          ImageConstant.logo,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
