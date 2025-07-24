void main() {
  print(add("4,\n3"));
}

int add(String numbersString){
  if(numbersString.isEmpty) return 0;
  final parts = numbersString.split(RegExp(r'[,\n]')).toList();
  final numbers = parts
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .map(int.parse);
  return numbers.fold(0, (a, b) => a + b);
}



