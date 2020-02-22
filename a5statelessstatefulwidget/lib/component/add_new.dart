import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  final Function addNew;

  AddNew(this.addNew);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew>{

  final namaController    = TextEditingController();
  final hargaController   = TextEditingController();
  final jumlahController  = TextEditingController();
  
  //METHOD INI AKAN BERJALAN KETIKA TOMBOL DARI WIDGET FLATBUTTON DITEKAN
  void saveNewItem(){
    final nama = namaController.text;
    final harga = hargaController.text;
    final jumlah = int.parse(jumlahController.text);

    if(nama.isEmpty || harga.isEmpty || jumlah <= 0){
      return;
    }
    widget.addNew(nama, harga, jumlah);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                namaBarang(),
                hargaBarang(),
                jumlahBarang(),
                simpanBarang() 
            ],  
          ),
        ),  
    );
  }

  Widget namaBarang(){
    return TextField(
      decoration : InputDecoration(
        labelText : 'Nama Barang'),
        controller : namaController
      );
  }

  Widget hargaBarang(){
    return TextField(
      decoration : InputDecoration(
          labelText : 'Harga Barang'
      ),
      controller : hargaController,
      keyboardType: TextInputType.number
      );
  }

  Widget jumlahBarang(){
    return TextField(
      decoration : InputDecoration(
          labelText : 'Jumlah Barang'
      ),
      controller : jumlahController,
      keyboardType: TextInputType.number
      );
  }

  Widget simpanBarang(){
    return FlatButton(
      color: Colors.pink,
      onPressed: saveNewItem, 
      child: Text('Simpan', style: TextStyle(color: Colors.white) ,)
      );
  }
}