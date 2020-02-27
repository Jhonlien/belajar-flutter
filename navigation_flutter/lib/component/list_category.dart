import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String image;

  ListCategory(this.id,this.title,this.description, this.image);

  void goToNewScreen(BuildContext context){
    //definisikan routing dan mengirimkan argument berupa id, title, description
    Navigator.of(context).pushNamed('/places', arguments: {'id' : id, 'title' : title, 'description': description});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToNewScreen(context);
      },
      highlightColor: Colors.white.withAlpha(30),
      splashColor: Colors.white.withAlpha(20),
      child: Card(
        elevation: 0,
        child:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: 
                  Image.network(image, height: 20,width: double.infinity,),
              ),
              SizedBox(height:4),
              Center(child: Text(title))
            ],
          ),
        )
      ),

    );
  }
}