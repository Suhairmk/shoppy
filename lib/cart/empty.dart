import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Image.asset('assets/images/empty cart.png',height: 400,),
    Text('Your Cart is Empty..',style: TextStyle(fontSize: 25),)
    ],);
  }
}