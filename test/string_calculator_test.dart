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
    test('should support a custom delimiter', () {
      expect(calculator.add('//;\n1;2'), 3);
    });

    test('should multiply if delimiter * is found', () {
      expect(calculator.add('//*\n1*2'), 2);
    });
    test(
      'should support a custom delimiter that is a regex special character',
      () {
        expect(calculator.add('//*\n1*2*3'), 6);
      },
    );
    test('should throw an exception when a negative number is provided', () {
      expect(
        () => calculator.add('1,-2,3'),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            'Exception: negatives not allowed: -2',
          ),
        ),
      );
    });

    test(
      'should throw an exception with all negative numbers in the message',
      () {
        expect(
          () => calculator.add('//;\n1;-2;3;-4'),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'message',
              'Exception: negatives not allowed: -2, -4',
            ),
          ),
        );
      },
    );
    test('should ignore numbers bigger than 1000', () {
      expect(calculator.add('2,1001'), 2);
    });

    test('should not ignore the number 1000', () {
      expect(calculator.add('2,1000'), 1002);
    });

    test('should support custom delimiters of any length', () {
      expect(calculator.add('//[***]\n1***2***3'), 6);
    });
    test('should support multiple custom delimiters', () {
      expect(calculator.add('//[*][%]\n1*2%3'), 6);
    });

    test('should support multiple custom delimiters of any length', () {
      expect(calculator.add('//[**][%%]\n1**2%%3'), 6);
    });
  });
}
