import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';

import '../home/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
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
                                prefixIcon: const Icon(Icons.key_sharp),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off))),
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
                                hintText: 'Conform password',
                                hintStyle:
                                    const TextStyle(color: Colors.black12),
                                labelText: 'Conform Password',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.key_sharp),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off))),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homescreen()));
                              }, label: const Text('SUBMIT')),
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
