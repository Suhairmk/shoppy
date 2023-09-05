import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/home/home.dart';
import 'package:myapp/login/forgotpass.dart';
import 'package:myapp/login/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController email = TextEditingController();
final TextEditingController passWord = TextEditingController();
bool isPasswordVisible = false;
final FirebaseAuth _auth = FirebaseAuth.instance;

void clearTextFields() {
  email.clear();
  passWord.clear();
}



class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                              'LogIn',
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
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'enter email here',
                                hintStyle:
                                    const TextStyle(color: Colors.black12),
                                labelText: 'E-mail',
                               
                                labelStyle:
                                    const TextStyle(color: Colors.white),
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
                              controller: passWord,
                              obscureText:
                                  !isPasswordVisible, // Toggle obscureText based on the variable
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
                                prefixIcon: const Icon(Icons.key_rounded),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    // Toggle the password visibility
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons
                                            .visibility_off, // Toggle icon based on password visibility
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgortPass()));
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    textAlign: TextAlign.end,
                                  )),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                                    final userCredential =
                                        await _auth.signInWithEmailAndPassword(
                                      email: email.text,
                                      password: passWord.text,
                                    );
                                    if (userCredential.user != null) {
                                      // Successfully logged in
                                      // Navigate to next screen or perform required action
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  Homescreen())));
                                    }
                                  } catch (e) {
                                    alertDialog(
                                        context, "Invalid email or password");
                                  }
                                  clearTextFields();
                                },
                                label: const Text('SUBMIT')),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              TextButton(
                                  onPressed: () {
                                    //navigate to register screen
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: const Text('Sign Up'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 3,
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                              thickness: 1,
                            )),
                      ),
                      Text(' OR '),
                      Expanded(
                        child: Container(
                            height: 3,
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                              thickness: 1,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Continue with Google',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              'assets/images/gogle.png',
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Continue with Apple',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              'assets/images/aple.png',
                              height: 20,
                              width: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void alertDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      });
}
