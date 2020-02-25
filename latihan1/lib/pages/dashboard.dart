import 'package:flutter/material.dart';
import '../models/product_m.dart';

class Dashboard extends StatelessWidget {
  final List<ProductM> product;
  Dashboard(this.product);

  double get total{
    return product.fold(0, (sum, item){
      return sum += item.harga;
    });
  }

  int get totalQty{
    return product.fold(0,(sum, item){
      return sum += item.jumlah;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 4, 
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Column(children: <Widget>[
              Text('Total :' + total.toStringAsFixed(0), style: TextStyle(fontWeight: FontWeight.bold),),
            ],
            ),
            Column(children: <Widget>[
              Text('Total :' + totalQty.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
            ],
            ),
            
          ],),
        )
      );
  }
}