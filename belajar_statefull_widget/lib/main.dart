import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  String textdata ='keren';
  void tekanTombol() {
    setState(() {
      number++;
      if(number % 2 == 0)
      {
        textdata = 'mantap';
      }
      else
      {
        textdata = 'keren';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(textdata),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text(number.toDouble().toString()),
            RaisedButton(onPressed: tekanTombol, child: Text('Tambah Bilangan'))
        ],
      )),
    ));
  }
}
