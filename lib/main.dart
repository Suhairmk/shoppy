import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';
import 'package:myapp/home/search.dart';
import 'package:myapp/login/getstart.dart';


import 'package:myapp/provider/appProvider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,) {
    return ChangeNotifierProvider(create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home:  Homescreen(),
      ),
    );
  }
}


