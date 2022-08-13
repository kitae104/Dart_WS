class Person {
  late int age = calculation();

  void printAge() {
    print('age');
  }
}
int calculation() {
  print("calculation");
  return 30;
}

void main(){
  Person p = Person();
  p.printAge();
  print(p.age);
}