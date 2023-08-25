import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg1.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(8, 18), spreadRadius: 10)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/explr.png',
          ),
          const SizedBox(
            height: 130,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  Color.fromARGB(255, 112, 62, 199),
                  Color.fromARGB(255, 94, 68, 139),
                ],
              ),
              color: Colors.deepPurple.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  // elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        color: Colors.white),
                  ),
                ),
                label: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    ));
  }
}
