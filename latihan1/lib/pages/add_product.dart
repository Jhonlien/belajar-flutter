import 'package:flutter/material.dart';

class AddProductItem extends StatefulWidget {

  final Function addProductItem;

  //fungsi dipanggil dari main.dart
  AddProductItem(this.addProductItem);

  @override
  _AddProductItemState createState() => _AddProductItemState();
}

class _AddProductItemState extends State<AddProductItem> {
  final namaC = TextEditingController();
  final hargaC = TextEditingController();
  final jumlahC = TextEditingController();
  
  void saveNewItem(){
      final id = 1;
      final nama = namaC.text;
      final harga = hargaC.text;
      final jumlah = int.parse(jumlahC.text);

      if(nama.isEmpty|| harga.length<=0 || harga.isEmpty || jumlah <=0){
        return;
      }
      widget.addProductItem(id,nama, double.parse(harga),jumlah);
      Navigator.of(context).pop();
    }
    

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              inputNama(),
              inputHarga(),
              inputJumlah(),
              submitProduct()
            ]
          ),
    );
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
                  onPressed: saveNewItem,
                )
            )
      );
    }

//end
}
