import 'package:cyphermaster/core/consetvar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controler/OprationController.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OperationController controller =Get.put(OperationController());
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Image.asset(
              'assets/img/Pages.png',
              fit: BoxFit.fill,
            )),
          ],
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(16),
                child: Text(
                  'CYPHER MASTER',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white.withOpacity(0.6),

                      shadows: [Shadow(color: primary, blurRadius: 3.0)]),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.algorithmMethod.value='Encryption';
                          Get.toNamed('inputpage');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180,
                          height: 40,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primary,
                              boxShadow: [
                                BoxShadow(
                                    color: primary_shadow,
                                    blurRadius: 30.0,
                                    spreadRadius: 0.5)
                              ]),
                          child: Text('Encoding'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.algorithmMethod.value='Decryption';
                          Get.toNamed('inputpage');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180,
                          height: 40,
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primary,
                              boxShadow: [
                                BoxShadow(
                                    color: primary_shadow,
                                    blurRadius: 30.0,
                                    spreadRadius: 0.5)
                              ]),
                          child: Text('Decoding'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
