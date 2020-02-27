import 'package:flutter/material.dart';
import '../component/list_category.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
        title: Text('Aplikasi Pariwisata'),
      ),
      body: 
        GridView(
          padding: EdgeInsets.all(10.0),
          children: 
            CATEGORIES_DUMMY_DATA.map((cat) => ListCategory(cat.id, cat.title, cat.description, cat.image)).toList(),
          gridDelegate:  
            SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150, //MENGATUR BESARNYA ELEMEN GRID PER ITEMNYA, 
              childAspectRatio: 1.5, //MENGATUR ASPEK RASIO
              crossAxisSpacing: 10, //MENGATUR JARAK ELEMENT SECARA HORIZONTAL
              mainAxisSpacing: 10, //MENGATUR JARAK ELEMENT SECARA VERTICAL),
            )
        )
      );
  }
}