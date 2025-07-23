class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Split the string by comma, convert each part to an integer, and sum them up.
    // This approach works for one or two numbers.
    final numberParts = numbers.split(',');
    int sum = 0;
    for (final part in numberParts) {
      sum += int.parse(part.trim());
    }
    return sum;
  }
}
