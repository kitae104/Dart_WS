void main(){
  print(add(a:4, b:5));
}

int add({required int a,required int b}){
  int sum = a + b;
  return sum;
}