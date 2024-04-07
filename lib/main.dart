import 'dart:js';

import 'package:flutter/material.dart';
import 'package:minimal_shoping_app/pages/cart_page.dart';
import 'package:minimal_shoping_app/pages/intro_page.dart';
import 'package:minimal_shoping_app/pages/shop_page.dart';
import 'package:minimal_shoping_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

import 'models/shop.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage()
      },
    );
  }
}
