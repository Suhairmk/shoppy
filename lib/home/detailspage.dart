
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/api/model.dart';
import 'package:myapp/cart/cartFrame.dart';
import 'package:myapp/order/summary.dart';

import 'package:provider/provider.dart';

import '../provider/appProvider.dart';







@override
Widget builddetails(BuildContext context, index) {
  String text = 'Add To Cart';
  String text1 = 'Go To Cart';

  final size = MediaQuery.of(context).size.width;
  final pro = Provider.of<AppProvider>(context, listen: false);
  final product = pro.products[index];
  
  return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: 20,),
            Container(
                height: 50,
                width: size / 2 - 8,
                child: ElevatedButton(
                    onPressed: () {
                      if (pro.isExist(product)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartFrame()));
                      } else {
                        pro.addFavorate(FavProducts(
                            id: product.id,
                            title: product.title,
                            price: product.price,
                            description: product.description,
                            category: product.category,
                            image: product.image,
                            rating: product.rating));

                            Navigator.pushReplacement(
                             context,
                             MaterialPageRoute(
                         builder: (BuildContext context) => builddetails(context, index)));
                      }
                      
                    },
                    child: Text(pro.isExist(product) ? text1:text),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(244, 211, 211, 28)),
                        shadowColor: MaterialStatePropertyAll(Colors.black)))),

            Container(
                height: 50,
                width: size / 2 - 8,
                child: ElevatedButton(
                  onPressed: () {
                    final p = pro.products[index];
                    pro.addSinglesummary(Summary(
                        id: p.id,
                        title: p.title,
                        price: p.price,
                        description: p.description,
                        category: p.category,
                        image: p.image,
                        rating: p.rating));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildSummary()));
                  },
                  child: Text('Buy Now'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                      shadowColor: MaterialStatePropertyAll(Colors.black)),
                )),
            //SizedBox(width: 20,),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.error.isNotEmpty) {
            return Text(provider.error);
          }

          if (provider.products.isEmpty) {
            return CircularProgressIndicator(); // Show a loading indicator
          }

          // Render your UI using provider.products
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(provider.products[index].image),
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Homescreen()));
                        },
                        icon: Icon(Icons.arrow_back)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                            alignment: AlignmentDirectional.bottomEnd),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  provider.products[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                RatingBarIndicator(
                  rating:provider.products[index].rating.rate,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  itemCount: 5,
                  itemSize: 22.0,
                  direction: Axis.horizontal,
                ),
                Divider(
                  thickness: 4,
                  color: Colors.black12,
                ),
                Container(
                  color: Color.fromARGB(17, 76, 175, 79),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '70% off  ',
                        style: TextStyle(color: Colors.green, fontSize: 25),
                      ),
                      Column(
                        children: [
                          Text(
                            'Now only ',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            '',
                          ),
                        ],
                      ),
                      Text(
                        '\$' + provider.products[index].price.toString(),
                        style: TextStyle(fontSize: 29),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  provider.products[index].description,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ));
}
