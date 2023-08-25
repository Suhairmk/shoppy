import 'package:flutter/material.dart';
import 'package:myapp/api/model.dart';
import 'package:myapp/order/placed.dart';
import 'package:myapp/order/upi.dart';
import 'package:myapp/provider/appProvider.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
   PaymentScreen({Key? key, required this.totalAmount}) : super(key: key);
 final double totalAmount;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? payment;

  @override
  Widget build(BuildContext context) {
    var text = 'Continue';
    var text1 = 'Place Order';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Payments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              '  Payment Options',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2,
                color: Colors.black12,
                thickness: 2,
              ),
            ),
            // Radiobuttons
            RadioListTile(
              title: Text("UPI Payment"),
              value: "upi",
              groupValue: payment,
              onChanged: (value) {
                setState(() {
                  payment = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Cash on Delivery"),
              value: "cash",
              groupValue: payment,
              onChanged: (value) {
                setState(() {
                  payment = value.toString();
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                '\$${widget.totalAmount}',//totalAmount
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final pro = Provider.of<AppProvider>(context, listen: false);
                if (payment == 'cash') {
                  for (var product in pro.summarydata) {
                    pro.removeFavSum(product.id);
                  }
                  pro.addDeliverd();
//if the buying  product contain on favoratelist,i need to remove it

                  pro.clearList();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlacedOrder()));
                }
                if (payment == 'upi') {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpiScreen()));
                }
              },
              child: Container(
                width: 130,
                height: 40,
                child: Center(
                    child: Text(
                  payment == 'cash' ? text1 : text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            ),
          ],
        ),
      ),
    );
  }
}
