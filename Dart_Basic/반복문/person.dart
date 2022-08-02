class Person{
  String? name;
  int? age;

  void setA(int x){
    this.age = x;
  }

  void show(){
    print(this.age);
    print(this.name);
  }
}

void main(){
  Person p1 = new Person();
  p1.age = 20;
  p1.name = 'James';
  p1.show();

  // 캐스케이드 표기법
  p1..name = 'kitae'
    ..setA(20)
    ..show();
}