import 'package:flutter/material.dart';
import '../models/cart.dart';

class ProductList extends StatelessWidget{
  //DEFINISIKAN VARIABLE CARTS YANG BERFUNGSI UNTUK MENAMPUNG LIST DATA, 
  //DIMANA TIPENYA MENGGUNAKAN LIST DAN STRUKTUR DATANYA MERUJUK PADA MODEL Cart
  final List<Cart> carts;
  //CONSTRUCTOR UNTUK MEMINTA DATA
  ProductList(this.carts);

  
  @override
  Widget build(BuildContext context){
    return Container(
      child: carts.isEmpty ?  
      Card(
        elevation : 4,
        margin    : EdgeInsets.all(10), 
        color: Colors.white,
        child: 
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('No One Data')
                  ],
                )
              ],
            ),
          ),
      )
      :
      ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color:Theme.of(context).primaryColor, width:1)
                  ),
                  child: Text(carts[index].qty.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  ), 
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(carts[index].title, style: Theme.of(context).textTheme.title),
                      Text('Harga: Rp ' + carts[index].harga.toStringAsFixed(0), style: TextStyle(fontSize: 12, color: Colors.grey),),
                  ]
                )
              ],
            )
          );
        },
        itemCount: carts.length,
      )
    );
  }

}