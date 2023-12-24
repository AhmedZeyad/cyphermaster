import 'algorithm.dart';

class VigenereAlgorithm extends Algorithm {
  VigenereAlgorithm() : super('Vigenere', null, '', '', null);

  @override
  String encrypt() {

    String cipher = '';
    int alphaCounter = 0;

bool check=true;
    if (!key.runes.every((rune) =>
    rune >= 65 && rune <= 90 || rune >= 97 && rune <= 122)) {
      return 'reor';
    }
    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);

      if (charCode >= 65 && charCode <= 90 ||
          charCode >= 97 && charCode <= 122) {
        int keyIndex = ((i - alphaCounter) % key.toString().length);
        int charOffset = charCode >= 65 && charCode <= 90
            ? 'A'.codeUnitAt(0)
            : 'a'.codeUnitAt(0);
        int k = (charCode >= 65 && charCode <= 90 ? (key[keyIndex])
            .toUpperCase()
            .codeUnitAt(0) : (key[keyIndex]).toLowerCase().codeUnitAt(0)) -
            charOffset;
        k = check == true ? k : -k;
        // cipher += String.fromCharCode((mod(((charCode + k) - charOffset),  26)) + charOffset);
        cipher += String.fromCharCode(
            ((charCode - charOffset + k) % 26 + 26) % 26 + charOffset);
      }
      else {
        cipher += input[i];
      }
    }

    return cipher;
  }

  @override
  String decrypt() {
    String cipher = '';
    int alphaCounter = 0;
    bool check=false;
    if (!key.runes.every((rune) =>
    rune >= 65 && rune <= 90 || rune >= 97 && rune <= 122)) {
      return 'reor';
    }
    for (var i = 0; i < input.length; i++) {
      int charCode = input[i].codeUnitAt(0);

      if (charCode >= 65 && charCode <= 90 ||
          charCode >= 97 && charCode <= 122) {
        int keyIndex = ((i - alphaCounter) % key.toString().length);
        int charOffset = charCode >= 65 && charCode <= 90
            ? 'A'.codeUnitAt(0)
            : 'a'.codeUnitAt(0);
        int k = (charCode >= 65 && charCode <= 90 ? (key[keyIndex])
            .toUpperCase()
            .codeUnitAt(0) : (key[keyIndex]).toLowerCase().codeUnitAt(0)) -
            charOffset;
        k = check == true ? k : -k;
        cipher += String.fromCharCode(
            ((charCode - charOffset + k) % 26 + 26) % 26 + charOffset);
      }
      else {
        cipher += input[i];
      }
    }

    return cipher;
  }
}
