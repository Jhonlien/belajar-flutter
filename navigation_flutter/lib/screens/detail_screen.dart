import 'package:flutter/material.dart';
import '../dummy_data.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context).settings.arguments as String;
    print(route);
    final selectedPlace = PLACES_DUMMY_DATA.firstWhere((places) => places.id == route);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail' + selectedPlace.name)
      ),
      //gunakan SingleChildScrollView agar halaman bisa di scrool
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              //posisi bawah dibuat melengkung menggunakan border radius
              Image(
                image: NetworkImage(selectedPlace.image),
              ),
              Positioned(
                bottom: 20,
                right: 15,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical : 5, horizontal : 20),
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: <Widget>[
                       Text(
                          selectedPlace.name,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        //DIBAWAH TEKSNYA KITA TAMPILKAN NAMA PENULISNYA / INFORMATORNYA
                        Text(
                          "Author: " + selectedPlace.author,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
             Card(
               elevation: 0,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(children: <Widget>[
                    Icon(Icons.monetization_on, size: 20,),
                    Text("Tiket Masuk: Rp ${selectedPlace.price}", style: Theme.of(context).textTheme.title,)
                  ],
                ),
              )
            ),
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(selectedPlace.description, style: TextStyle(fontSize: 10),)
              ),
            )
          ],
        )
      ),
    );
  }
}