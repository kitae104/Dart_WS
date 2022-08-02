void main() async {
  methodA();
  await methodB();
  methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future(() {
    print('C running Future from $from');
  }).then((_) {
    print('C end Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}
