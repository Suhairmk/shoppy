import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/api/model.dart';
import 'package:myapp/home/detailpage.dart';

import 'package:myapp/order/summary.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

double calculateTotalWithQuantity(int quantity) {
  final pro = Provider.of<AppProvider>(context, listen: false);
  double total = 0.0;

  for (FavProducts product in pro.favorateproduct) {
    total += product.price * quantity; // Calculate total based on price and quantity
  }

  return total;
}

 int quantity = 1; 
  @override
  Widget build(
    BuildContext context,
  ) {
    final pro = Provider.of<AppProvider>(context, listen: false);
    final length=pro.favorateproduct.length;
    final total='Total: \$${calculateTotalWithQuantity(quantity).toStringAsFixed(2)}';
   
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                total,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pro.addFavsummary();
                //  pro.summarydata.addAll(pro.favproducts as Iterable<Summary>);
                //   pro.addFavsummary(Summary(id:.id, title: title, price: price, description: description, category: category, image: image, rating: rating));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BuildSummary()));
              },
              child: Container(
                width: 130,
                height: 40,
                child: const Center(
                    child: Text(
                  'Place order',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)),
            ),
          ],
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          // Render your UI using provider.products
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.favproducts.length,
                  itemBuilder: (context, index) {
                    // Build your UI items here using provider.products[index]
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    builddetails(context, index)));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: NetworkImage(
                                    provider.favproducts[index].image,
                                  ),
                                  height: 150,
                                  width: 100,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 35,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                              height: 16,
                                              width: MediaQuery.of(context).size.width-140,
                                              child: Text(provider
                                                  .favproducts[index].title)))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RatingBarIndicator(
                                    rating: provider.favorateproduct[index].rating.rate,
                                    itemBuilder: (context, index) => const Icon(
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
                                        provider.favproducts[index].price
                                            .toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                 Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) {
                      quantity--; // Decrease quantity, but ensure it's not less than 1
                    }
                  });
                },
              ),
              Column(
                children: [
                  Text(quantity.toString()), // Display the current quantity
                  Text(
                    'Quantity',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    quantity++; // Increase quantity
                  });
                },
              ),
            ],
          ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                       const SizedBox(
                                        width: 50,
                                       ),
                                      Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width-200,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            final pro =
                                                provider.favorateproduct[index];
                                            provider.removeFavorate(pro);
                                          },
                                          child: const Text('Remove'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black12,
                height: 3,
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Price('+length.toString()+' item)',), Text(' \$${calculateTotalWithQuantity(quantity).toStringAsFixed(2)}',)],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('\$${calculateTotalWithQuantity(quantity).toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold))
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
              // BottomNavigationBar(items: <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Text('ee'),),BottomNavigationBarItem(icon: Text('ee'),)])
            ],
          );
        },
      ),
    );
  }
}
