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
      // Escape the delimiter to ensure it's treated as a literal character in the regex.
      delimiters = RegExp(RegExp.escape(customDelimiter));
    }

    return numbersPart
        .split(delimiters)
        .where((part) => part.isNotEmpty)
        .map((part) => int.parse(part.trim()))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
