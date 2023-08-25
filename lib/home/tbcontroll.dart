 
 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/home/detailpage.dart';

import '../provider/appProvider.dart';


DefaultTabController tabcontroller(BuildContext context, AppProvider provider,TabController tabController) {
    return DefaultTabController(
                            length: 10,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: Colors.black26,
                                  labelColor: Colors.orange,
                                  unselectedLabelColor: Colors.black,
                                  controller: tabController,
                                  tabs: const [
                                    Tab(
                                      text: 'All',
                                    ),
                                    Tab(text: 'Mobiles'),
                                    Tab(text: 'Fashion'),
                                    Tab(text: 'Fresh'),
                                    Tab(text: 'Electronics'),
                                    Tab(text: 'Home'),
                                    Tab(text: 'Beauty'),
                                    Tab(text: 'Furniture'),
                                    Tab(text: 'Toys'),
                                    Tab(text: 'Appliance'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height -
                                      300,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      //all
                                      Column(
                                        children: [
                                          // Text(''),
                                          Expanded(
                                            child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Number of columns in the grid
                                                mainAxisSpacing:
                                                    8, // Spacing between rows
                                                crossAxisSpacing:
                                                    8, // Spacing between columns
                                                childAspectRatio:
                                                    .70, // Width-to-height ratio of grid items
                                              ),
                                              itemCount:
                                                  provider.products.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                builddetails(
                                                                    context,
                                                                    index),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 210,
                                                        child: Column(
                                                          children: [
                                                            Image(
                                                              image: NetworkImage(
                                                                  provider
                                                                      .products[
                                                                          index]
                                                                      .image),
                                                              height: 130,
                                                              width: 190,
                                                            ),
                                                            const SizedBox(
                                                                height: 6),
                                                            SingleChildScrollView(
                                                              child:
                                                                  Container(
                                                                height: 50,
                                                                width: 180,
                                                                child: Text(provider
                                                                    .products[
                                                                        index]
                                                                    .title),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8,
                                                                      right:
                                                                          8),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    provider
                                                                        .products[
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        color:
                                                                            Colors.red),
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    rating: provider
                                                                        .products[
                                                                            index]
                                                                        .rating
                                                                        .rate,
                                                                    itemBuilder:
                                                                        (context, index) =>
                                                                            const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .orange,
                                                                    ),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        18.0,
                                                                    direction:
                                                                        Axis.horizontal,
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
                                            ),
                                          ),
                                        ],
                                      ),

                                      ListView(
                                        scrollDirection: Axis.vertical,
                                        children: const [
                                          Center(
                                            child:
                                                Text('Mobiles Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child:
                                                Text('Fashion Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child: Text('Fresh Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child: Text(
                                                'Electronics Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child: Text('Home Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child: Text('Beauty Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child:
                                                Text('Furniture Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child: Text('Toys Tab Content'),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        children: const [
                                          Center(
                                            child:
                                                Text('Appliance Tab Content'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
  }

