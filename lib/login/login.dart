import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';
import 'package:myapp/login/forgotpass.dart';
import 'package:myapp/login/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            obscureText: true,
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
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off))),
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
                                          builder: (context) => ForgortPass()));
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homescreen()));
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
    );
  }
}
