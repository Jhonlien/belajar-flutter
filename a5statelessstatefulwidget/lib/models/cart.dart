import 'package:flutter/foundation.dart';

class Cart{
  final int id;
  final String title;
  final double harga;
  final int qty;
  
  Cart({
    @required this.id,
    @required this.title,
    @required this.harga,
    @required this.qty
});

}