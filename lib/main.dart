import 'package:cyphermaster/view/screen/InputScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cyphermaster/view/screen/HomeScreen.dart';
import 'package:cyphermaster/view/screen/SplashScreen.dart';

void main() {
  // Get.put<SplashController>(SplashController());

  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Rubik', textTheme: TextTheme()),
    title: 'My App',
    initialRoute: '/splash',
    getPages: [
      GetPage(name: '/splash', page: () => SplashScreen()),
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(name: '/inputpage', page: () => InputPage()),
      // Add other routes as needed
    ],
  ));
}



//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Continuous Image Size Toggle',
//       home: ImageToggleScreen(),
//     );
//   }
// }
//
// class ImageToggleScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Continuous Image Size Toggle'),
//       ),
//       body: Center(
//         child: ImageToggleWidget(),
//       ),
//     );
//   }
// }
//
// class ImageToggleWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ImageToggleController>(
//       init: ImageToggleController(),
//       builder: (controller) {
//         return AnimatedContainer(
//           color: Colors.black,
//           duration: Duration(milliseconds: 300),
//           // width: (controller.isLarge.value) ? 200.0 : 100.0,
//           // height: (controller.isLarge.value) ? 200.0 : 100.0,
//           width: 500.0,
//           height: 500.0,
//           child: Image.asset( (controller.isLarge.value)?
//           'assets/img/logo.png':'assets/img/logoof.png', // Replace with your image URL
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ImageToggleController extends GetxController {
//   RxBool isLarge = true.obs;
//   late Timer _timer;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
//       toggleImageSize();
//     });
//   }
//
//   @override
//   void onClose() {
//     _timer.cancel();
//     super.onClose();
//   }
//
//   void toggleImageSize() {
//     isLarge.value = !isLarge.value;
//     update();
//   }
// }
