import 'package:flutter/material.dart';


class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _count = 0;

  void addCount(){
    setState(() {
      _count++;
    });
  }

  void minCount(){
    setState(() {
      if(_count == 0){
        return 0;  
      }
      return _count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          FlatButton(
            color: Colors.blueAccent,
            onPressed: addCount, 
            child: Text('Tambah', style: TextStyle(color: Colors.white),)
          ),
          FlatButton(
            color: Colors.red,
            onPressed: minCount, 
            child: Text('Kurang', style: TextStyle(color: Colors.white),)
            ),
          Text('$_count')
        ],
      ),
    );
  }
  
}

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       child: Column(
//         children:<Widget>[
//           Row(children: <Widget>[
//             Icon(Icons.add_circle)
//           ],),
//           Card(
//             child: Column(
//               children:<Widget>[
//                 Image.network('https://daengweb.id/front/dw-theme/images/logo-head.jpg')
//               ]
//             )
//           )
//         ]
//       )
//     );
//   }
// }