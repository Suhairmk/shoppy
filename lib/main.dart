import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';

import 'package:myapp/login/getstart.dart';

import 'package:myapp/provider/appProvider.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
// ...
 WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: AuthRedirector(),
      ),
    );
  }
}

class AuthRedirector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator if Firebase is initializing.
        } else {
          final user = snapshot.data;
          if (user != null) {
            // User is logged in, direct them to the home screen.
            return Homescreen();
          } else {
            // User is not logged in, direct them to the GetStart screen.
            return GetStart();
          }
        }
      },
    );
  }
}
