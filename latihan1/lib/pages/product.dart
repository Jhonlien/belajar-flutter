import 'package:flutter/material.dart';
import '../models/product_m.dart';

class Product extends StatelessWidget {
  final List<ProductM> _product;
  
  Product(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _product.isEmpty ? 
      Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children:<Widget>[
                  Text('No One Data')
                ]
              )
            ],
          ),
        ),
      )
      :
      ListView.builder(
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width:2),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal:10),
                    padding: EdgeInsets.all(10.0),
                    child: Text(_product[index].jumlah.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment : MainAxisAlignment.start,
                      children: <Widget>[
                        Text(_product[index].nama,),
                        Text(_product[index].harga.toStringAsFixed(0),)
                      ],
                    )
                  )
                ],
              ),
            )
          );
        },
        itemCount: _product.length,
      )
    );
  }
}