import 'package:flutter/material.dart';
import './home.dart';
import './news.dart';
import './popular.dart';

void main() => runApp(Tabs());

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabs', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.add_circle),),
              Tab(icon: Icon(Icons.add_box),),
              Tab(icon: Icon(Icons.add_call))
            ]),
        ),
        body: 
        TabBarView(
          controller: controller,
          children: <Widget>[
            HomeWidget(),
            Popular(),
            News()
          ]
          )
      )
    );
  }
}