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

      String customDelimiter;
      if (delimiterLine.startsWith('//[') && delimiterLine.endsWith(']')) {
        // Handles "//[delimiter]\n" format
        customDelimiter = delimiterLine.substring(3, delimiterLine.length - 1);
      } else {
        // Handles "//d\n" format for backward compatibility
        customDelimiter = delimiterLine.substring(2);
      }
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

    return numberList
        .where((n) => n <= 1000) // Ignore numbers bigger than 1000
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
