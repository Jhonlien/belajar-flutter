import 'package:flutter/material.dart';
import './screen/register.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Form & Validation'),
        ),
      body: RegisterScreen(),
      )
    );
  }
} 