import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}
String? useremail;
String? usermobile;
String? username;
class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {

 User? user = FirebaseAuth.instance.currentUser;
  
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          // Document exists in Firestore
         
          final phoneNumber = documentSnapshot['phoneNumber'];
          final email = documentSnapshot['email'];
          final name = documentSnapshot['displayName'];

        
             setState(() {
            useremail = email;
            username = name;
            usermobile=phoneNumber;
          });
            } else {
          // Document does not exist
          print('Document does not exist');
        }
      });
    }
       

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.edit,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {},
        //   )
        //],
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homescreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 20, bottom: 40),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black12,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username ??'',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(214, 0, 0, 0)),
                        ),
                        Text(useremail??''),
                        Text('address\nhousename\n pin')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 260,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit),
                        Text('  Edit Profile', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit_location),
                        Text('  Edit Delivery Address',
                            style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        Text('  Wishlist', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text('  Help Center', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text('  Coupons', style: TextStyle(fontSize: 18))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
