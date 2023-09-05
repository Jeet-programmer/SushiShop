import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/cart_page.dart';
import 'package:sushishop/pages/intro_pages.dart';
import 'package:sushishop/pages/menu_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage':(context) => IntroPage(),
        '/menupage':(context) => MenuPage(),
        '/cartPage':(context) => CartPage(),
      },
    );
  }
}

