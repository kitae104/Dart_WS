void main(){
    List<String> rainbow = ['빨, 주, 노, 초, 파, 남, 보'];
    
    for(int i = 0; i<rainbow.length; i++){
        print(rainbow[i]);
    }

    for(String x in rainbow){
      print(x);
    }
}