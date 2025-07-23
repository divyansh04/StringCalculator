class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    var numbersPart = numbers;
    var delimiters = <String>[',', '\n'];

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterLine = parts.first;
      numbersPart = parts.sublist(1).join('\n');

      final delimiterRegex = RegExp(r'\[(.*?)\]');
      final matches = delimiterRegex.allMatches(delimiterLine);

      if (matches.isNotEmpty) {
        delimiters = matches.map((m) => RegExp.escape(m.group(1)!)).toList();
      } else {
        // Fallback for single, non-bracketed delimiter
        delimiters = [RegExp.escape(delimiterLine.substring(2))];
      }
    }

    final combinedDelimiterRegex = RegExp(delimiters.join('|'));

    final numberList =
        numbersPart
            .split(combinedDelimiterRegex)
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
