import 'dart:js';

import 'package:flutter/material.dart';
import 'package:minimal_shoping_app/components/mybutton.dart';
import 'package:minimal_shoping_app/models/product.dart';
import 'package:minimal_shoping_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

//   user pressed pay button
void payButtonPressed(BuildContext context){
  showDialog(context: context, builder: (context)=> AlertDialog(
    content: Text("User wants o pay! Connect this app to your payment backend"),
  ));
}


// remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //   show a dialog box to ask user to confirm
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item from our cart ? "),
              actions: [
                //   cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),

                //   yes button
                MaterialButton(
                    child: Text("Yes"),
                    onPressed: () {
                  //   pop dialog box
                  Navigator.pop(context);

                  //   add to cart
                  context.read<Shop>().removeFromCart(product);
                })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //   car list
          Expanded(
              child: cart.isEmpty ? Center(child: Text("Your cart is empty...")) : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //   get individual item in cart
                    final item = cart[index];

                    //   return as a cart tile UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  })),

          //   pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: ()=> payButtonPressed, child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
