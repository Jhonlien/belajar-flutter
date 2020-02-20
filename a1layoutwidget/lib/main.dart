import 'package:flutter/material.dart';

void main(){
  runApp(LayoutWidget());
}

class LayoutWidget extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Layout And Widget', style: TextStyle(color: Colors.blueAccent, fontSize: 15),),
          backgroundColor : Colors.white,
          leading: Icon(Icons.home, color: Colors.blueAccent,),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child:Column(
            children:<Widget>[
              Card(
                child: Column(
                children: <Widget>[
                  Icon(Icons.home),
                  Text('This Is Home')
                ],
                )
              ),
              Card(
                child:Column(
                  children:<Widget>[
                    Image.network('https://daengweb.id/front/dw-theme/images/logo-head.jpg')
                  ]
                )
              )
            ]
          )
        ),
      )
    );
  }
}