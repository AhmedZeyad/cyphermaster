import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  RxString img = ''.obs;
  RxString imgon = 'assets/img/logo.png'.obs;
  RxString imgof = 'assets/img/logoof.png'.obs;

  @override
  void onInit() {
    super.onInit();
    img.value=imgon.value;
     Future.delayed(Duration(seconds: 1), () {
       changeImage();

     });
     Future.delayed(Duration(seconds: 3), () {
       // update();
      Get.offNamed('/home');
    });
  }

  void changeImage() {
      img.value =imgof.value ;
      update();
  }}
