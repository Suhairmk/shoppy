import 'package:flutter/material.dart';
import 'package:myapp/order/placed.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class UpiScreen extends StatefulWidget {
  const UpiScreen({super.key});

  @override
  State<UpiScreen> createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            ElevatedButton(
              onPressed: () {
                 final pro = Provider.of<AppProvider>(context, listen: false);
                 for (var product in pro.summarydata) {
                    pro.removeFavSum(product.id);
                  }
                  pro.addDeliverd();
//if the buying  product contain on favoratelist,i need to remove it

                   pro.clearList();
                  
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlacedOrder()));
              },
              child: Container(
                width: 130,
                height: 40,
                child: Center(
                    child: Text(
                'Pay',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'UPI',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.orange,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            TextFormField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'UPI ID',hintText: 'Enter UPI id here'),)
          ],
        ),
      ),
    );
  }
}
