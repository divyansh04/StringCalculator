class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String numbersPart = numbers;
    RegExp delimiters = RegExp(r'[,\n]');

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterLine = parts.first;
      numbersPart = parts.sublist(1).join('\n');

      final customDelimiter = delimiterLine.substring(2);
      delimiters = RegExp(RegExp.escape(customDelimiter));
    }

    final numberList =
        numbersPart
            .split(delimiters)
            .where((part) => part.isNotEmpty)
            .map((part) => int.parse(part.trim()))
            .toList();

    final negatives = numberList.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw Exception('negatives not allowed: ${negatives.join(', ')}');
    }

    return numberList.fold(
      0,
      (previousValue, element) => previousValue + element,
    );
  }
}
