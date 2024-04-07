import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_shoping_app/models/product.dart';
import 'package:minimal_shoping_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatefulWidget {
  final Product product;


  const MyProductTile({super.key, required this.product});

  @override
  State<MyProductTile> createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> {

  // dd to cart  on button pressed
  void addToCart(BuildContext context){
  //   show a dialog box to ask user to confirm to add to cart
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text("Add this item to your cart"),
      actions: [
      //   cancel button
        MaterialButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text("Calcel"),
        ),

      //    yes button
        MaterialButton(onPressed: (){
        //   pop dialog box
          Navigator.pop(context);

        //   add to cart
          context.read<Shop>().addToCart(widget.product);

        },
          child: Text("Yes"),
        )

      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //   product image
          Column(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.favorite))),

              SizedBox(
                height: 25,
              ),

              //product name
              Text(
                widget.product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              //   productt decription
              Text(
                widget.product.description,
                style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          SizedBox(height: 25,),

          //   product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price
              Text(widget.product.price.toStringAsFixed(2)),

            //   add to cart button 
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: IconButton(onPressed: (){
                    addToCart(context);

                  }, icon: Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
