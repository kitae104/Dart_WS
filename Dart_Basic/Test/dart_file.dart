import 'package:flutter/material.dart';
import 'package:navigator_page/person.dart';

class SecondPage extends StatelessWidget {

  late final Person person;

  SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: ElevatedButton(
        onPressed: (){
          Navigator.pop(context, 'ok'); // 문자열을 이전 페이지로 전달함
        },
        child: Text('이전 페이지로'),
        style: ElevatedButton.styleFrom(
          primary: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
        ),
      ),
    );
  }
}

class Person{
  String? name;
  int? age;

  Person(this.name, this.age);
}
