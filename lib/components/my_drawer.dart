import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            //   draver header :Logo
            DrawerHeader(
                child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )),

            const SizedBox(
              height: 25,
            ),
            //   shop tile
            MyListTile(
              text: "Shop",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyListTile(
              text: "Cart",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pushNamed(context, '/cart_page');
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: MyListTile(
            text: "Shop",
            icon: Icons.logout,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          ),
        ),
      ],
    );
  }
}
