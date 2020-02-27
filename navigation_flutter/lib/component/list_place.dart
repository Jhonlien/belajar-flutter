import 'package:flutter/material.dart';

class ListPlace extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final String description;

  ListPlace(this.id, this.name, this.image, this.description);

  void goToDetail(context){
    Navigator.of(context).pushNamed('/detail', arguments: id);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListTile(  
          title: Text(name),
          subtitle: Text(description.substring(0,100) + '...'),
          onTap: (){
            goToDetail(context);
          },
        ),
      ),
    );
  }
}