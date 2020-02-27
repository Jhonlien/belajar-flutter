import 'package:flutter/material.dart';
import '../component/list_place.dart';
import '../dummy_data.dart';

class PlacesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //Mengambil Argument yang dikirimkan oleh navigasi ketika ditap
    final route = ModalRoute.of(context).settings.arguments as Map<String,String>;
    //yang mana argumen yang dikirimkan berisi kumpulan data yang dalamnya adalah key dan value
    final id = route['id'];
    //print(route);//ambil value dari key id
    //ambil data berdasarkan ID kategori dan ditempatkan kedalam variable placelist
    final title = route['title'];

    final placeList = PLACES_DUMMY_DATA.where((place){
      return place.category == id;
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Wisata ' + title),
        ),
        body: 
            ListView.builder(itemBuilder: (ctx,index){
              if(placeList[index].category.isEmpty){
                  return Text('no one else data');
              }
              return ListPlace(
                placeList[index].id,
                placeList[index].name,
                placeList[index].image,
                placeList[index].description,
              );
            },
            itemCount: placeList.length,
            )
    );
  }
}