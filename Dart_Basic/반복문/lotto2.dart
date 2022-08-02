import 'dart:math';

Set<int> lottoNumber(){
  final random = Random();
  final Set<int> lottoSet = {};    // 구동시 초기화 

  while(lottoSet.length != 6){
    lottoSet.add(random.nextInt(45) + 1);
  }

  print('당첨번호');
  print(lottoSet.toList());

  return lottoSet;
}

Set<int> myNumber(){
  final random = Random();
  final Set<int> mySet = {};    // 구동시 초기화 

  while(mySet.length != 6){
    mySet.add(random.nextInt(45) + 1);
  }

  print('내 추첨번호');
  print(mySet.toList());

  return mySet;
}

void checkNumber(lottoSet, mySet){

  int match = 0;

  for(int lotto in lottoSet){
    for(int myNum in mySet){
      if(lotto == myNum){
        match++;
        print('당첨번호 : $myNum');
      }
    }
  }

  print('$match개의 당첨번호가 있습니다.');
}

void main(){
  Set<int>lottoFinal = lottoNumber();
  Set<int>myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}