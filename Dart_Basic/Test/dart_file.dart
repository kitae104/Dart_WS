import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stop-Watch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {

  Timer? _timer;                // 타이머

  int _time = 0;                // 0.01초마다 1씩 증가시킬 정수형 변수
  bool _isRunning = false;      // 현재 시각 상태를 나타낼 불리언 변수

  List<String> _labTimes = [];  // 랩타임에 표시할 시간을 저장할 리스트

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StopWatch"),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _clickButton();
          });
        },
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow), // 상태에 따라 다른 아이콘
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Widget _buildBody() {
    
    var sec = _time ~/ 100;                           // 몫 구하기
    var hundredth = '${_time % 100}'.padLeft(2, '0'); // 1/100초 - 빈 곳은 0으로 채움움
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(                         // 내부에 여러 위젯을 겹칠 수 있음
          children: [
            Column(
              children: [
                Row(                          // 시간을 표시하는 영역
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$sec",   // 초
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text("$hundredth"),       // 1/100 초로 표시
                  ],
                ),
                Container(            // 랩타임을 표시하는 영역
                  width: 100.0,
                  height: 200.0,
                  child: ListView(
                    children: _labTimes.map((time) => Text(time)).toList(),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,           // 왼쪽 아래 위치 - 초기화 버튼
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: _reset,    // reset 메소드 실행
                child: Icon(
                  Icons.rotate_left,
                ),
              ),
            ),
            Positioned(
              right:10.0,
              bottom: 10.0,           // 오른쪽 아래 위치 - 랩타임 버튼
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _recordLabTime('$sec.$hundredth');
                  });
                },
                child: Text("랩타임"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  // 1/100초에 한번씩 time 변수를 1 증가
  void _start() {
    _timer  = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  // 타이머 취소
  void _pause() {
    _timer?.cancel();
  }

  // 모든 상태를 초기화하고 화면을 다시 그림
  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _labTimes.clear();
      _time = 0;
    });
  }

  void _recordLabTime(String time){
    _labTimes.insert(0, '${_labTimes.length + 1}등 $time');
  }
}