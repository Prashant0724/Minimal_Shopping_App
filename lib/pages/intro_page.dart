import 'package:flutter/material.dart';
import 'package:minimal_shoping_app/components/mybutton.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            //   logo
            Icon(
              Icons.shopping_bag_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Minimal Shop',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text("Premium Quality Products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
        SizedBox(height: 25,),
          // button
            MyButton(onTap: (){
              Navigator.pushNamed(context, '/shop_page');
            }, child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
