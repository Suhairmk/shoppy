import 'package:flutter/material.dart';
import 'package:myapp/home/home.dart';

class PlacedOrder extends StatefulWidget {
  const PlacedOrder({super.key});

  @override
  State<PlacedOrder> createState() => _PlacedOrderState();
}

class _PlacedOrderState extends State<PlacedOrder> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Homescreen()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Image.asset(
                  'assets/images/conform1.gif',
                )),
                Text(
                  'Order Placed',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
