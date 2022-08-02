void main(){
  List<String> carMaker = ['BMW, Benz, Audi, Jaguar'];

  for(String x in carMaker){
    print(x);
  }

  carMaker.forEach((name) {
    print(name);
   });
}