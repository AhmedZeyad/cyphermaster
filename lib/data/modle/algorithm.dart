// models/algorithm.dart
class Algorithm {
  String name ;
  bool isTwoKey ;
  var key;
  var key2;
  String input ;
  String output ;

  Algorithm(
    this.name,
      this.key,
    this.input,
    this.output,
    this.key2,
      { this.isTwoKey=false,
      }
  );

  String encrypt() {
    // Default encryption implementation
    return '';
  }

  String decrypt() {
    // Default decryption implementation
    return 'text';
  }
}

// models/vigenere_algorithm.dart

// models/rail_fence_algorithm.dart

// models/affine_algorithm.dart

// models/caesar_algorithm.dart
