class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Split the string by comma, convert parts to integers, and sum them up.
    // This functional approach handles any amount of numbers.
    return numbers
        .split(',')
        .map((part) => int.parse(part.trim()))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
