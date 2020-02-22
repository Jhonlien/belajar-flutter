import 'package:flutter/material.dart';
import '../models/cart.dart';

class Dashboard extends StatelessWidget{
  //DEFINISIKAN VARIABLE CARTS YANG BERFUNGSI UNTUK MENAMPUNG LIST DATA, 
  //DIMANA TIPENYA MENGGUNAKAN LIST DAN STRUKTUR DATANYA MERUJUK PADA MODEL Cart
  final List<Cart> carts;
  //CONSTRUCTOR UNTUK MEMINTA DATA
  Dashboard(this.carts);
  //hitung jumlah carts
  int getTotal{
    return carts.fold(0, (sum, item){
      return sum += item.qty;
    });
  }
  //hitung jumlah bayar
  double get getHarga{
    return carts.fold(0, (sum, item){
      return sum += item.harga;
    });
  }

  @override
  Widget build(BuildContext context){
    return Card(
      elevation : 4,
      margin    : EdgeInsets.all(10), 
      child     : Padding(
        padding   : EdgeInsets.all(20),
        child     : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Total Item : ' + getTotal.toString(), style: Theme.of(context).textTheme.title,),
            ],
            ),
            Column(children: <Widget>[
              Text('Total Item : '+ getHarga.toStringAsFixed(0), style: Theme.of(context).textTheme.title,),

            ],)
          ],
        ),
      ),
    );
  }
}