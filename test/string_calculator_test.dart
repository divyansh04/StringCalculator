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
  });
}
