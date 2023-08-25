import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/api/model.dart';
import 'package:myapp/home/detailpage.dart';
import 'package:myapp/provider/appProvider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class SearchScreen extends StatefulWidget {
   // Add this line
final TabController tabController;
  const SearchScreen({Key? key, required this.tabController}) : super(key: key);


  @override
  State<SearchScreen> createState() => _SearchScreenState();
  
}

class _SearchScreenState extends State<SearchScreen> {

  void navigateToHomeScreenWithTab(BuildContext context, int tabIndex) {
    Navigator.pop(context); // Close the SearchScreen

    widget.tabController.animateTo(tabIndex);
  }

  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  // final List<Search> _allUsers = [];
  // List<Search> get users =>_allUsers;

  // This list holds the data for the list view
  List<Search> serchedProduct = [];
  bool empty = true;
  String text = '';
  // @override
  // initState() {
  //   final products = Provider.of<AppProvider>(context, listen: false).products;
  //   serchedProduct = products.map((product) => Search.fromProducts(product)).toList();
  //   super.initState();
  // }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    final products = Provider.of<AppProvider>(context, listen: false).products;

    List<Search> results = [];

    if (enteredKeyword.isEmpty) {
      setState(() {
        empty = true;
      });

      // If the search field is empty, display all products
      // results = products.map((product) => Search.fromProducts(product)).toList();
    } else {
      results = products
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .map((product) => Search.fromProducts(product))
          .toList();
      setState(() {
        empty = false;
      });
    }

    setState(() {
      serchedProduct = results;
      text = enteredKeyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController serchedText = TextEditingController();

    final products = Provider.of<AppProvider>(context, listen: false).products;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Kindacode.com'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 80,
                  child: CupertinoSearchTextField(
                    onChanged: (value) => _runFilter(value),
                    // controller: serchedText,
                  ),
                ),
                Icon(Icons.mic_outlined),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text.isEmpty ? '' : 'Serch Result for: ' + text,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: serchedProduct.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        mainAxisSpacing: 8, // Spacing between rows
                        crossAxisSpacing: 8, // Spacing between columns
                        childAspectRatio:
                            0.75, // Width-to-height ratio of grid items
                      ),
                      itemCount: serchedProduct.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        builddetails(context, index),
                                  ),
                                );
                              },
                              child: Container(
                                height: 240,
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          serchedProduct[index].image),
                                      height: 140,
                                      width: 190,
                                    ),
                                    const SizedBox(height: 6),
                                    SingleChildScrollView(
                                      child: Container(
                                        height: 50,
                                        width: 180,
                                        child:
                                            Text(serchedProduct[index].title),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            serchedProduct[index]
                                                .price
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                          RatingBarIndicator(
                                            rating: 2.75,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            itemCount: 5,
                                            itemSize: 18.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                          ],
                        );
                      },
                    )
                  : empty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      navigateToHomeScreenWithTab(context, 2); 
                                    },
                                    child: Text('Fashion'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      navigateToHomeScreenWithTab(context, 1); 
                                    },
                                    child: Text('Mobile'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      navigateToHomeScreenWithTab(context, 4); 
                                    },
                                    child: Text('Electronics'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                         navigateToHomeScreenWithTab(context, 6);                                
                           },
                                    child: Text('Beauty'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      : const Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
