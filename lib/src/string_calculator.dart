class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Use a regular expression to split by both comma and newline.
    final delimiters = RegExp(r'[,\n]');
    return numbers
        .split(delimiters)
        .where(
          (part) => part.isNotEmpty,
        ) // Ensure we don't parse empty strings from splits
        .map((part) => int.parse(part.trim()))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
