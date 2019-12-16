import 'package:flutter/material.dart';
import 'package:news_reader/home_screen.dart';


void main() => runApp(RssApp());

class RssApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,

      ),
      home: HomeScreen(),
    );
  }
}
