void main() {
  print(add("4,\n3"));
}

int add(String numbersString) {
  if (numbersString.isEmpty) return 0;

  String numbersPart = numbersString;
  String delimiterPattern = r'[,\n]';

  if (numbersString.startsWith('//')) {
    final splitInput = numbersString.split('\n');
    if (splitInput.length > 1) {
      final customDelimiter = RegExp.escape(splitInput[0].substring(2));
      delimiterPattern = customDelimiter;
      numbersPart = splitInput[1];
    }
  }

  final parts = numbersPart.split(RegExp(delimiterPattern));

  final numbers = parts
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .map(int.parse)
      .toList();

  final negatives = numbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed}');
  }

  return numbers.fold(0, (a, b) => a + b);
}
