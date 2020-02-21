import 'package:flutter/material.dart';
//import package http request dan asyncrounus
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(){
  runApp(QuranApp());
}

class QuranApp extends StatefulWidget {
  @override
  _QuranAppState createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp>{
  //DEFINE VARIABLE url UNTUK MENAMPUNG END POINT
  final String url = 'https://api.banghasan.com/quran/format/json/surat';
  //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY
  List data;
  Future<String> getData() async{
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var response =  await http.get(Uri.encodeFull(url), headers: {'accept' : 'application/json'});

    setState(() {
      var responseContent = json.decode(response.body);
      data = responseContent['hasil'];
    });
    return 'success';
  } 

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar : AppBar(
          title: Text('Quran', style: TextStyle(color: Colors.blueAccent)),
          leading: Icon(Icons.book,color: Colors.blueAccent),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: data == null ? 0: data.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                      ListTile(
                      //leading TAMPIL PADA SEBELAH KIRI
                      // DIMANA VALUE DARI leading ADALAH WIDGET TEXT
                      // YANG BERISI NOMOR SURAH
                        leading: Text(data[index]['nomor'], style: TextStyle(fontSize: 20.0),),
                      //title TAMPIL DITENGAH SETELAH leading
                      // VALUENYA ADALAH WIDGET TEXT
                      // YANG BERISI NAMA SURAH
                        title: Text(data[index]['nama'], style: TextStyle(fontSize: 30.0),),
                      //trailing TAMPIL PADA SEBELAH KANAN SETELAH title
                      //VALUE NYA ADALAH IMAGE, KETIKA VALUENYA DARI type ADALAH
                      // MEKAH MAKA AKAN MENAMPILKAN mekah.jpg
                      // SELAIN DARI ITU MENAMPILKAN IMAGE madinah.png
                        trailing: FlatButton(
                                    onPressed: (){
                                      
                                    }, 
                                    color: Colors.blueAccent,
                                    child: Icon(Icons.view_list, color: Colors.white,)),

                      //subtitle TAMPIL TEPAT DIBAWAH title
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Arti ', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(data[index]['arti'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('Jumlah Ayat ', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(data[index]['ayat'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),

                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('Diturunkan ', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(data[index]['type'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),

                              ],
                            ),
                          ]
                        )


                      )
                    ],
                  ),
                ),
              );
            }
          )
        ),
      )
    );
  }
}

