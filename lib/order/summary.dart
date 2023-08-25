import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/order/payment.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class BuildSummary extends StatefulWidget {
  const BuildSummary({super.key});

  @override
  State<BuildSummary> createState() => _BuildSummaryState();
}

class _BuildSummaryState extends State<BuildSummary> {
  double calculateTotalPrice() {
    final provider = Provider.of<AppProvider>(context, listen: false);
    double total = 0.0;
    for (var summaryItem in provider.summary) {
      total += summaryItem.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    final total = '\$${calculateTotalPrice()}';
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Order Summary'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                provider.clearList();
              },
              icon: Icon(Icons.arrow_back))),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AppProvider>(builder: (context, provider, child) {
              // Render your UI using provider.products
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Deliver to:'),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Text('change'),
                                        ),
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 7),
                                    child: Text(
                                      'name..',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                        'address \n  pin......\n.dis.....'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(provider.summary.length.toString()),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height - 350,
                          child: ListView.builder(
                            itemCount: provider.summary.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(
                                          image: NetworkImage(
                                            provider.summary[index].image,
                                          ),
                                          height: 150,
                                          width: 100,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 35,
                                              child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Container(
                                                      height: 16,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              140,
                                                      child: Text(provider
                                                          .summary[index]
                                                          .title)))),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RatingBarIndicator(
                                            rating: provider
                                                .summary[index].rating.rate,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            itemCount: 5,
                                            itemSize: 22.0,
                                            direction: Axis.horizontal,
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            '\$' +
                                                provider.summary[index].price
                                                    .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            children: [
                                              Text('1'),
                                              Text(
                                                'Quantity',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Price Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price(1 item)'),
                                  Text(total)
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount'),
                                  Text(
                                    '\$5',
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Charge'),
                                  Text(' FREE Delivry',
                                      style: TextStyle(color: Colors.green))
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black12,
                                height: 2,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Amount',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(total,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black12,
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 2,
                      color: Colors.black12,
                      thickness: 2,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                  '\$${calculateTotalPrice()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentScreen(totalAmount: calculateTotalPrice())));
              },
              child: Container(
                width: 130,
                height: 40,
                child: const Center(
                    child: Text(
                  'Continue',
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
