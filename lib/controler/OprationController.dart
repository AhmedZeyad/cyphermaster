// controllers/main_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/modle/algorithm.dart';
import '../data/modle/vigenere_algorithm.dart';
import '../data/modle/rail_fence_algorithm.dart';
import '../data/modle/affine_algorithm.dart';
import '../data/modle/caesar_algorithm.dart';

class OperationController extends GetxController {
  RxString algorithmName = 'Select Algorithm'.obs; // Store the algorithm name directly
  RxString algorithmMethod = 'Select Method'.obs; // Store the algorithm name directly
  RxString inputText = ''.obs;
  RxString outputText = ''.obs;
  RxString encryptionKey = ''.obs;
  bool isTwoKey=false;

  TextEditingController key = TextEditingController();
  TextEditingController msg = TextEditingController();
  TextEditingController key2 = TextEditingController();
  TextEditingController cipher = TextEditingController();
  List<Algorithm> algorithms = [
    VigenereAlgorithm(),
    RailFenceAlgorithm(),
    AffineAlgorithm(),
    CaesarAlgorithm(),
  ];


  List<DropdownMenuItem<String>> get item {
    List<DropdownMenuItem<String>> items = [];

    for (int i = 0; i < algorithms.length; i++) {
      items.add(DropdownMenuItem(child: Text(algorithms[i].name), value: algorithms[i].name));
    }

    return items;
  }

  Algorithm setAlgorithm(String algorithmname) {

      algorithmName.value = algorithmname;
      final selectedAlgorithmInstance = algorithms.firstWhere(
              (algorithm) =>
          algorithm.name == algorithmName.value);
isTwoKey= selectedAlgorithmInstance.isTwoKey==true?true:false;
      update();
      print (selectedAlgorithmInstance.name);
      print (selectedAlgorithmInstance.isTwoKey);
      return selectedAlgorithmInstance;
    }

     set setInputText(String text) {
      inputText.value = text;
    }

  set setEncryptionKey(String key) {
      encryptionKey.value = key;
    }
    void changeMethod(String option){
      algorithmMethod.value=option;
      update();
    }
void selectMethod(){if (algorithmMethod.value=='Encryption')
  encrypt();
    else if(algorithmMethod.value=='Decryption')
  decrypt();
    print(cipher.text);

}
    void encrypt() {

      final selectedAlgorithmInstance = algorithms.firstWhere(
              (algorithm) =>
          algorithm.name == algorithmName.value);
      selectedAlgorithmInstance.key=key.text;
      selectedAlgorithmInstance.input=msg.text;
      selectedAlgorithmInstance.key2=key2.text;
      cipher.text =
          selectedAlgorithmInstance.encrypt();
    }

    void decrypt() {
      print(algorithmName.value);

      final selectedAlgorithmInstance = algorithms.firstWhere(
              (algorithm) =>
          algorithm.name == algorithmName.value);
      selectedAlgorithmInstance.key=key.text;
      selectedAlgorithmInstance.key2=key2.text;

      selectedAlgorithmInstance.input=msg.text;
      cipher.text =
          selectedAlgorithmInstance.decrypt(
              );
    }
  }
