import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';

import '../home/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final TextEditingController registerName = TextEditingController();
final TextEditingController registeruseremail = TextEditingController();
final TextEditingController registerpassWord = TextEditingController();
final TextEditingController registerphoneNumber = TextEditingController();
final TextEditingController registerconformpass = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;
bool isvisible = false;
bool conformvisible = false;
String? conformpass;

void clearTextFields() {
  registerName.clear();
  registeruseremail.clear();
  registerpassWord.clear();
  registerconformpass.clear();
  registerphoneNumber.clear();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/logintop.jpg',
                height: 240,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                //   color: Colors.orange,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            controller: registerName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'enter Name here',
                              hintStyle: const TextStyle(color: Colors.black12),
                              labelText: 'Name',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            controller: registeruseremail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'enter E-mail here',
                              hintStyle: const TextStyle(color: Colors.black12),
                              labelText: 'E-mail',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            controller: registerphoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'enter phone number',
                              hintStyle: const TextStyle(color: Colors.black12),
                              labelText: 'Phone',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.phone),
                              prefixIconColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            controller: registerpassWord,
                            obscureText: !isvisible,
                            decoration: InputDecoration(
                                hintText: 'enter password here',
                                hintStyle:
                                    const TextStyle(color: Colors.black12),
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.key_sharp),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isvisible = !isvisible;
                                      });
                                    },
                                    icon: Icon(
                                      isvisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            
                            controller: registerconformpass,
                            obscureText: conformvisible,
                            
                            decoration: InputDecoration(
                                hintText: 'Conform password',
                                hintStyle:
                                    const TextStyle(color: Colors.black12),
                                labelText: 'Conform Password',
                                errorText: conformpass,
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.key_sharp),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        conformvisible = !conformvisible;
                                      });
                                    },
                                    icon: Icon(
                                      conformvisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ))),
                            // onChanged: (value) {
                            //   if (registerpassWord.text !=
                            //       registerconformpass.text) {
                                
                            //     setState(() {
                            //       conformpass = 'password not match';
                            //     });
                            //   } else {
                            //     null;
                            //   }
                            // },
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: FloatingActionButton.extended(
                              onPressed: () async {
                                try {
                                  final userCredential = await _auth
                                      .createUserWithEmailAndPassword(
                                    email: registeruseremail.text,
                                    password: registerpassWord.text,
                                  );
                                  print(userCredential);
                                  if (userCredential.user != null) {
                                    // Successfully registered
                                    // Store user data in Firestore
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(userCredential.user?.uid)
                                        .set({
                                      'email': registeruseremail.text,
                                      'displayName': registerName.text,
                                      'phoneNumber': registerphoneNumber.text,
                                    });
                                    alertDialog(
                                        context, "Registration Success");
           Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                                    // Navigate to next screen or perform required action
                                  } else {
                                    alertDialog(context,
                                        "Registration failed"); // Show an error if userCredential.user is null
                                  }
                                } catch (e) {
                                  print('error:- $e');
                                  alertDialog(context, "Registration failed");
                                }
                                clearTextFields();
                              },
                              label: const Text('SUBMIT')),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('LogIn'))
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
