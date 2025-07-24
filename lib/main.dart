void main() {
  print(add("4,6,10,-2,9"));
}

int add(String numbers){
  List<int> listOfNumbers = numbers.split(",").map((e)=> int.parse(e)).toList();
  return listOfNumbers.fold(0, (sum, number) => sum + number);
}



