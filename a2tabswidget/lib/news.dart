import 'package:flutter/material.dart';


class News extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children:<Widget>[
          Row(children: <Widget>[
            Icon(Icons.add_box)
          ],),
          Card(
            child: Column(
              children:<Widget>[
                Image.network('https://daengweb.id/front/dw-theme/images/logo-head.jpg')
              ]
            )
          )
        ]
      )
    );
  }
}