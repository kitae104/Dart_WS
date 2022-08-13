class Person {
  late int age;

  int sum(int age, int num){
    this.age = age;
    int total = age + num;
    return total + age;
  }
}

void main(){
  Person p = Person();
  print(p.sum(100, 50));
}