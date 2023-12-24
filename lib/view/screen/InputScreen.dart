import 'package:cyphermaster/core/consetvar.dart';
import 'package:cyphermaster/view/widget/CustumTextFormFild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controler/OprationController.dart';
import '../widget/CustomButtonstyle.dart';
import '../widget/CustomDrobDone.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/img/Pages.png',
              ),    fit: BoxFit.fill,
                  )),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),

                        children: [
                          GetBuilder<OperationController>(
                              init: OperationController(),
                              builder: (controller) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        'CYPHER MASTER',
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white.withOpacity(0.6),
                                            shadows: [
                                              Shadow(color: primary, blurRadius: 3.0)
                                            ]),
                                      ),
                                    ),
                                    CustomDrobDone(
                                      onChanged: (algo) {
                                        controller.setAlgorithm(algo!);
                                      },
                                      items: controller.item,
                                      value: controller.algorithmName.value,
                                    ),
                                    CustomDrobDone(
                                      onChanged: (option) {
                                        controller.changeMethod(option!);
                                      },
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text('Encryption'),
                                          value: 'Encryption',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('Decryption'),
                                          value: 'Decryption',
                                        ),
                                      ],
                                      value: controller.algorithmMethod.value,
                                    ),
                                    CustomTextFormField(
                                        controller: controller.key,
                                        hintText: 'Key',
                                        labelText: 'labelText',
                                        iconData: Icons.key,
                                        onChanged: (d) {}),
                                    Visibility(
                                      visible: controller.isTwoKey,
                                      child: CustomTextFormField(
                                          controller: controller.key2,
                                          hintText: 'Key',
                                          labelText: 'labelText',
                                          iconData: Icons.key,
                                          onChanged: (d) {}),
                                    ),
                                    Container(
                                      child: CustomTextFormField(
                                          controller: controller.msg,
                                          maxLines: 5,
                                          hintText:
                                              controller.algorithmMethod == 'Decryption'
                                                  ? 'Cipher'
                                                  : 'Message',
                                          labelText: 'labelText',
                                          iconData: Icons.message,
                                          onChanged: (d) {}),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          print(controller.cipher.text);
                                          print(controller.key.text);
                                          print(controller.msg.text);
                                          if (controller.algorithmMethod ==
                                                  'Select Method' ||
                                              controller.algorithmName ==
                                                  'Select Algorithm') {
                                            Get.snackbar(
                                              'select algo',
                                              'plz you must select algo before click ',
                                              borderRadius: 20, borderWidth: 2,
                                              // backgroundColor: Colors.black,
                                              borderColor: Color(0xff03C6D2),
                                            );
                                          } else
                                            controller.selectMethod();
                                        },
                                        child: CustomButtonStyle(
                                            child: Text(controller.algorithmMethod.value))),
                                    Container(
                                      child: CustomTextFormField(
                                          readOnly: true,
                                          controller: controller.cipher,
                                          hintText:
                                              controller.algorithmMethod == 'Encryption'
                                                  ? 'Cipher'
                                                  : 'Message',

                                          // hintText: 'Cipher',
                                          labelText: 'labelText',
                                          iconData: Icons.star,
                                          maxLines: 5,
                                          onChanged: (d) {}),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
