void main(){

  var test = (List<int>.generate(45, (i) => i+1)..shuffle()).sublist(0, 6);
  print(test);
}