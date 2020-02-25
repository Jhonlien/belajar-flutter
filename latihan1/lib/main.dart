import 'package:flutter/material.dart';

//model
import 'models/product_m.dart';
//Page
import 'pages/dashboard.dart';
import 'pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final List<ProductM> _product = [
    ProductM(id: "1", nama: "Shampo", harga: 1000, jumlah: 1)
  ];

  void clearState(){
    setState(() {
      _product.clear();
    });
  }

  void addProduct(String nama, double harga, int jumlah){
    final newItem = ProductM(id: DateTime.now().toString(), nama: nama, harga:harga, jumlah:jumlah);
    setState(() {
      _product.add(newItem);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Belanja App'),
        actions: <Widget>[
            IconButton(icon: Icon(Icons.clear), onPressed: clearState)
          ],
        ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                  Navigator.push(context, 
                                    MaterialPageRoute<Null>(
                                              builder: (BuildContext context){
                                                return AddProductItem(addProduct);
                                              },
                                                fullscreenDialog: true                                              
                                              )
                                );
              }, 
              color: Colors.pink,
              child: Row(
                children: 
                  <Widget>[
                    Icon(Icons.add, color: Colors.white,),
                    Text(
                      'Tambah Data',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
              )
            ),
            Dashboard(_product),
            Product(_product),
          ],
        ),
      ),
    );
  }  
}

class AddProductItem extends StatefulWidget {
  final Function addProduct;
  AddProductItem(this.addProduct);
  @override
  _AddProductItemState createState() => _AddProductItemState();
}

class _AddProductItemState extends State<AddProductItem> {
  final namaC = TextEditingController();
  final hargaC = TextEditingController();
  final jumlahC = TextEditingController();

  void saveNewItem(){
      final nama = namaC.text;
      final harga = hargaC.text;
      final jumlah = int.parse(jumlahC.text);
      if(nama.isEmpty|| harga.isEmpty || jumlah <= 0 ){
        return;
      }
      widget.addProduct(nama, double.parse(harga), jumlah);
      Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Tambah Data'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: (){Navigator.of(context).pop();},
            )
        ],
        leading: Icon(Icons.add),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
              children: <Widget>[
                inputNama(),
                inputHarga(),
                inputJumlah(),
                submitProduct()
              ]
            ),
      )
    ));
        
  }
    Widget inputNama(){
        return TextField(
          decoration : InputDecoration(labelText:'Nama Product'),
          controller: namaC,
        );
    }

    Widget inputHarga(){
        return TextField(
          decoration : InputDecoration(labelText:'Harga Product'),
          controller: hargaC,
        );
    }

    Widget inputJumlah(){
        return TextField(
          decoration : InputDecoration(
            labelText:'Jumlah Product',
          ),
          controller: jumlahC,
        );
    }

    Widget submitProduct(){
      return Container( 
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child : SizedBox(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.pink, 
                  textColor: Colors.white, 
                  child: Text('Tambahkan'),
                  onPressed: saveNewItem
                )
            )
      );
    }
}