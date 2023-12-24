import 'algorithm.dart';

class RailFenceAlgorithm extends Algorithm {
  RailFenceAlgorithm() : super('Rail Fence', null, '', '', null);
  @override
  String encrypt() {
    List<List<String>> matrix = List.generate(
      int.parse(key),
          (index) => List.filled(input.length, ''),
    );

    int row = 0;
    int direction = 1;

    for (int i = 0; i < input.length; i++) {
      matrix[row][i] = input[i];

      if (row == int.parse(key) - 1) {
        direction = -1;
      } else if (row == 0) {
        direction = 1;
      }

      row += direction;
    }

    return matrix.expand((row) => row).where((char) => char.isNotEmpty).join();
  }

  @override
  String decrypt() {
    List<List<String>> matrix = List.generate(
      int.parse(key),
          (index) => List.filled(input.length, ''),
    );

    int row = 0;
    int direction = 1;

    for (int i = 0; i < input.length; i++) {
      matrix[row][i] = '*';

      if (row == int.parse(key) - 1) {
        direction = -1;
      } else if (row == 0) {
        direction = 1;
      }

      row += direction;
    }

    int index = 0;
    for (int i = 0; i < int.parse(key); i++) {
      for (int j = 0; j < input.length; j++) {
        if (matrix[i][j] == '*') {
          matrix[i][j] = input[index++];
        }
      }
    }

    row = 0;
    direction = 1;
    String decrypted = '';

    for (int i = 0; i < input.length; i++) {
      decrypted += matrix[row][i];

      if (row == int.parse(key) - 1) {
        direction = -1;
      } else if (row == 0) {
        direction = 1;
      }

      row += direction;
    }

    return decrypted;
  }
  // @override
  // String encrypt() {
  //   int row = int.parse(key),
  //       col = input.length,
  //       x = 0,
  //       y = 0;
  //   String result = '';
  //   bool dir = false;
  //   var matrix = List.generate(
  //       row, (i) => List<String>.filled(col, "", growable: false));
  //   for (var i = 0; i < input.length; i++) {
  //     if (x == 0 || x == row - 1) dir = !dir;
  //     matrix[x][y++] = input[i];
  //     dir ? x++ : x--;
  //   }
  //   for (var i = 0; i < row; i++) {
  //     for (var j = 0; j < col; j++) {
  //       result += matrix[i][j];
  //     }
  //   }
  //   return result;// Replace with actual implementation
  // }

  // @override
  // String decrypt() {
  //   String result = '';
  //   int row = 0,
  //       col = 0,
  //       index = 0;
  //   // bool dir;
  //   var matrix = List.generate(
  //       int.parse(key), (i) => List.filled(input.length, '', growable: false));
  //
  //   for (var i = 0; i < input.length; i++) {
  //     matrix[row][col++] = '*';
  //     row == 0 ? row++ : row--;
  //   }
  //
  //   for (var i = 0; i < int.parse(key); i++) {
  //     for (var j = 0; j < input.length; j++) {
  //       if (matrix[i][j] == '*' && index < input.length)
  //         matrix[i][j] = input[index++];
  //     }
  //   }
  //
  //   row = 0;
  //   col = 0;
  //
  //   for (var i = 0; i < input.length; i++) {
  //     if (matrix[row][col] != '*') result += matrix[row][col++];
  //     row == 0 ? row++ : row--;
  //   }
  //
  //   return result; // Replace with actual implementation
  // }
}
class RailFenceCipher {
  static final RegExp nonAlphaRegExp = RegExp('[^a-zA-Z ]');
  static List<dynamic> _fence(dynamic input, int numRails) {

    List<List<dynamic>> fence = List<List<dynamic>>.generate(numRails, (i) => List<dynamic>.generate(input.length, (j) => null));
    List<int> rails = List.generate(numRails - 1, (i) => i);
    rails.addAll(List<int>.generate(numRails - 1, (i) => (numRails - i - 1)));

    for(int i = 0; i < input.length; i++) {
      fence[rails[i % rails.length]][i] = input[i];
    }

    List<dynamic> output = [];
    for(var rail in fence) {
      for(var c in rail) {
        if(c != null)
          output.add(c);
      }
    }
    return output;
  }

  static String _railfence(String input, String rails, {bool encrypt = false}) {

    if(nonAlphaRegExp.allMatches(input).length != 0)
      return 'Invalid characters in plaintext!';

    int ?key = int.tryParse(rails);
    if(key == null)
      return 'Invalid number of rails. Must be integer.';

    var fence = _fence(input, key);
    if(encrypt)
      return fence.join('');
    else {
      List<int> range = List.generate(input.length, (i) => (i));
      var pos = _fence(range, key);
      List<String> deciphered = [];

      for(int i in range) {
        deciphered.add(input[pos.indexWhere((element) => element == i)]);
      }
      return deciphered.join('');
    }
  }
}