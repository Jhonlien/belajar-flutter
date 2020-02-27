import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/places_screen.dart';
import 'screens/detail_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pariwisata',
      theme: ThemeData(accentColor: Colors.pink, primaryColor: Colors.pinkAccent),
      routes: {
        '/' : (ctx) => CategoryScreen(),
        '/places': (ctx) => PlacesScreen(),
        '/detail': (ctx) => DetailScreen()
      }
    );
  }
}

