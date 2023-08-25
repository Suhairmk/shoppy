import 'package:flutter/material.dart';
import 'package:myapp/cart/cartLoad.dart';
import 'package:myapp/cart/empty.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';
import '../provider/appProvider.dart';

class CartFrame extends StatefulWidget {
  const CartFrame({super.key});

  @override
  State<CartFrame> createState() => _CartFrameState();
}

class _CartFrameState extends State<CartFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            'My Cart',
          ),
          centerTitle: true,
        ),
        body: Consumer<AppProvider>(builder: (context, provider, child) {
          // Render your UI using provider.products
          return provider.favorateproduct.isEmpty ? Empty() : CartScreen();
        }));
  }
}
