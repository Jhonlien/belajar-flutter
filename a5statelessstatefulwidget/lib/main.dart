import 'package:a5statelessstatefulwidget/models/cart.dart';
import 'package:flutter/material.dart';
import 'component/product_list.dart';
import 'component/dashboard.dart';
import 'component/add_new.dart';
import 'dart:math';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belanja App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.purpleAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
      Cart(id: 1, title: 'Sayur', harga: 1000, qty: 1),
      Cart(id: 2, title: 'Buah', harga: 1200, qty: 1),
    ]; 

  Random rand = new Random();

  void _openModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return AddNew(_addNewItem);
      }
    );
  }

  void _addNewItem(String title, double harga, int qty){
    final newItem = Cart(id: rand.nextInt(10), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem);
    });
  }

    //FUNGSI INI UNTUK MENGHAPUS SEMUA DATA PADA VARIABLE CARTS
  void _resetCarts() {
    setState(() {
      _carts.clear(); //SET STATENYA KEMUDIAN CLEAR
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belanja App'),
        actions: <Widget>[
            FlatButton(child: Icon(Icons.clear, color: Colors.white,), onPressed: () => _resetCarts(),)
          ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _openModal(context);
        },
        backgroundColor: Colors.pink,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
