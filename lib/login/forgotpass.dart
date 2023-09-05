import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgortPass extends StatefulWidget {
  const ForgortPass({Key? key}) : super(key: key);

  @override
  State<ForgortPass> createState() => _ForgortPassState();
}

class _ForgortPassState extends State<ForgortPass> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _forgotEmail = TextEditingController();
  bool _emailSent = false;

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
                  'assets/images/forgot.jpg',
                  height: 240,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/images/padlock.png'),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 2,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          child: TextFormField(
                            controller: _forgotEmail,
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
                          height: 23,
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
                                await _auth.sendPasswordResetEmail(
                                  email: _forgotEmail.text,
                                );

                                // Email sent successfully
                                setState(() {
                                  _emailSent = true;
                                });
                                _forgotEmail.clear();

                                // Show a Snackbar message to inform the user
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'Password reset email sent.'),
                                  ),
                                );
                              } catch (e) {
                                print('error $e');
                              }
                            },
                            label: const Text('Send Link'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Show a message if the email was sent
                        if (_emailSent)
                          const Text(
                            'Password reset email has been sent.',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
