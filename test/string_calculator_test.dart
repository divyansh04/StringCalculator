import 'package:flutter_test/flutter_test.dart';

import 'package:string_calculator/src/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUpAll(() {
      calculator = StringCalculator();
    });

    test('should return 0 for an empty string', () {
      expect(calculator.add(''), 0);
    });

    test('should return the number itself when a single number is given', () {
      expect(calculator.add('5'), 5);
    });

    test('should return the sum of two numbers separated by a comma', () {
      expect(calculator.add('1,2'), 3);
    });

    test('should return the sum of an unknown amount of numbers', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });

    test('should handle new lines between numbers', () {
      expect(calculator.add('1\n2,3'), 6);
    });
    test('should ignore empty strings from trailing delimiters', () {
      expect(calculator.add('1,2,'), 3);
    });

  });
}
