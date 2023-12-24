import 'algorithm.dart';

class AffineAlgorithm extends Algorithm {
  AffineAlgorithm() : super('Affine', null, '', '', null,isTwoKey: true);
@override

  @override
  String encrypt() {
    String cipher = '';

    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);
      if (charCode >= 65 && charCode <= 90 ||
          charCode >= 97 && charCode <= 122) {
        int charOffset = charCode >= 65 && charCode <= 90
            ? 'A'.codeUnitAt(0)
            : 'a'.codeUnitAt(0);
        cipher += String.fromCharCode(
            (((int.parse(key) * (charCode - charOffset)) + int.parse(key2)) %
                    26) +
                charOffset);
      } else {
        cipher += input[i];
      }
    }
    return cipher;
  }

  @override
  String decrypt() {
  output='';
    int inverse = 0;
    for (var i = 0; i < 26; i++) {
      if ((int.parse(key) * i) % 26 == 1) {
        inverse = i;
      }
    }
    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);
      if (charCode >= 65 && charCode <= 90) {
        output += String.fromCharCode(
            ((inverse * ((charCode + 65 - int.parse(key2))) % 26)) + 65);
      } else if (charCode >= 97 && charCode <= 122) {
        int charValue = ((input[i].codeUnitAt(0) - 97 - int.parse(key2)));
        if (charValue < 0) {
          charValue += 26; // Ensure the value is positive and within 0-25
        }
        output += String.fromCharCode(((inverse * (charValue) % 26)) + 97);
      } else {
        output += input[i];
      }
    }
    return output;
  }
}
