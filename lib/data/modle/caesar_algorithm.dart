import 'algorithm.dart';

class CaesarAlgorithm extends Algorithm {
  CaesarAlgorithm (): super('Caesar', null, '', '', null);



  @override
  String encrypt() {
    bool check=true;
    String cipher = '';
    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);
      if (charCode >= 65 && charCode <= 90 ||
          charCode >= 97 && charCode <= 122) { //check if letter
        int charOffset = charCode >= 65 && charCode <= 90
            ? 65
            : 97; //check if upper or lower
        check == true
            ? cipher +=
            String.fromCharCode((charCode + int.parse(key) - charOffset) % 26 + charOffset)
            : cipher += String.fromCharCode(
            (charCode - int.parse(key) - charOffset) % 26 + charOffset);
        // if true do encryption else do decryption and convert to string
      }
      else {
        cipher += input[i];
      }
    }
    return cipher;// Replace with actual implementation
  }

  @override
  String decrypt() {
    bool check=false;
    String cipher = '';
    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);
      if (charCode >= 65 && charCode <= 90 ||
          charCode >= 97 && charCode <= 122) { //check if letter
        int charOffset = charCode >= 65 && charCode <= 90
            ? 65
            : 97; //check if upper or lower
        check == true
            ? cipher +=
            String.fromCharCode((charCode + int.parse(key) - charOffset) % 26 + charOffset)
            : cipher += String.fromCharCode(
            (charCode - int.parse(key) - charOffset) % 26 + charOffset);
        // if true do encryption else do decryption and convert to string
      }
      else {
        cipher += input[i];
      }
    }
    return cipher;// Replace with actual implementation
  }



}
