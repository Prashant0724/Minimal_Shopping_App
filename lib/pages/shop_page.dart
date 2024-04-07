import 'package:flutter/material.dart';
import 'package:minimal_shoping_app/components/product_tile.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shop Page"),
          actions: [
            //   go to cart
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const Drawer(child: MyDrawer()),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            // shop subtitle
            Center(
              child: Text(
                "Pick from a selected list of premium products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            // product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //   get each individual product from shop
                    final product = products[index];

                    //       return as a product tile UI.
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
