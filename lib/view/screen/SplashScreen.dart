import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controler/SplashController.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        'assets/img/Splash Screen.png',
    ),    fit: BoxFit.fill,
    )),
      child:
        GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => Center(
            child: Image.asset(
              controller.img.value,
              fit: BoxFit.cover,
              height: 600,width: 600,
            ),
          ),
        )
      ,
    )
        );
  }
}
