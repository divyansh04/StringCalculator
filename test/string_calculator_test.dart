import 'package:flutter_test/flutter_test.dart';

import 'package:string_calculator/src/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    test('should return 0 for an empty string', () {
      // Arrange
      final calculator = StringCalculator();
      // Act
      final result = calculator.add('');
      // Assert
      expect(result, 0);
    });

    test('should return the number itself when a single number is given', () {
      // Arrange
      final calculator = StringCalculator();
      // Act
      final result = calculator.add('5');
      // Assert
      expect(result, 5);
    });

    test('should return the sum of two numbers separated by a comma', () {
      // Arrange
      final calculator = StringCalculator();
      // Act
      final result = calculator.add('1,2');
      // Assert
      expect(result, 3);
    });
  });
}
