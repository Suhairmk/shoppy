import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/cart/cartFrame.dart';
import 'package:myapp/home/account.dart';
import 'package:myapp/cart/cartLoad.dart';
import 'package:myapp/home/detailpage.dart';
import 'package:myapp/home/more.dart';
import 'package:myapp/home/myorder.dart';
import 'package:myapp/home/search.dart';
import 'package:myapp/home/tabcontroller.dart';
import 'package:myapp/login/login.dart';
import 'package:myapp/provider/appProvider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
String? emailf ;
    String? namef ;

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentindex = 0;

  void navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(tabController: tabController),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 10, vsync: this);
    final provider = Provider.of<AppProvider>(context, listen: false);
    provider.getProductDetails();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final num = Provider.of<AppProvider>(context).favproducts.length;
    bool status = false;
    if (num != 0) {
      setState(() {
        status = true;
      });
    }
    if (currentindex == 2) {
      setState(() {
        status = false;
      });
    }


 

    
    User? user = FirebaseAuth.instance.currentUser;
  
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          // Document exists in Firestore
         
          
          final email = documentSnapshot['email'];
          final name = documentSnapshot['displayName'];

       
             setState(() {
            emailf = email;
            namef = name;
          });
         

          
        
        } else {
          // Document does not exist
          print('Document does not exist');
        }
      });
    }

    final color = currentindex == 1 ? Colors.orange : Colors.black;
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentindex,
        children: [
          buildHome(context, tabController, currentindex),
          const MyorderScreen(),
          const CartFrame(),
          const AccountScreen(),
          // Use buildHome() as the last screen
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 65, 218, 88),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        // selectedIconTheme: IconThemeData(color: Colors.blue),
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage(
                  'assets/images/myorder.png',
                ),
                height: 25,
                color: color,
              ),
              label: 'My Orders'),
          BottomNavigationBarItem(
              icon: Badge(
                label: Text(
                  num.toString(),
                ),
                child: Icon(Icons.shopping_cart),
                isLabelVisible: status,
              ),
              label: 'My Cart'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      appBar: currentindex == 0
          ? AppBar(
              title: Image.asset(
                'assets/images/explr.png',
                height: 50,
                width: 130,
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              actions: [
                PopupMenuButton(
                  shadowColor: Colors.black12,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("First"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Second"),
                      value: 2,
                    ),
                  ],
                ),
              ],
              elevation: 0,
            )
          : null,
      //drawer
      drawer: currentindex == 0
          ? Container(
              width: MediaQuery.of(context).size.width - 60,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(5),
                ),
                child: Drawer(
                  backgroundColor: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          //----------------------------
                                          namef ??'',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800,
                                              color:
                                                  Color.fromARGB(214, 0, 0, 0)),
                                        ),
                                        Text(emailf.toString())
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentindex = 3;
                                      });
                                    },
                                    child: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: MediaQuery.of(context).size.height - 190,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'Tools',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.language),
                                    Text('  Select Language',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.language),
                                    Text('  Notification Settings',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.language),
                                    Text('  Saved Cards & Wallet',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.language),
                                    Text('  Saved Cards & Wallet',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.language),
                                    Text('  Saved Cards & Wallet',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Divider(
                                  height: 2,
                                  color: Colors.black12,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'feedback & Information',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.note),
                                    Text('  Terms,Policies and Licenses',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.question_mark_rounded),
                                    Text('  Brows FAQs',
                                        style: TextStyle(fontSize: 17))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 742,
                                ),
                                InkWell(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width - 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black12),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.logout),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'LogOut',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ))
          : null,
    );
  }
}

Widget buildHome(
  BuildContext context,
  TabController tabController,
  index,
) {
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() async {
    final now = DateTime.now();
    final currentindex = index;

    if (currentindex != 0 || tabController.index != 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homescreen()));
      return false; // Prevent immediate app exit after navigation
    }

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Press back again to exit')),
      );

      return false; // Prevent app from closing
    } else {
      SystemNavigator.pop();
      return true; // Allow app to close
    }
  }

  return WillPopScope(
    onWillPop: onWillPop,
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<AppProvider>(
          builder: (context, provider, child) {
            if (provider.error.isNotEmpty) {
              return Text(provider.error);
            }

            if (provider.products.isEmpty) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show a loading indicator
            } else {
              // Render your UI using provider.products
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //scroll

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Heading',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('Description'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contest) =>
                                                  SearchScreen(
                                                      tabController:
                                                          tabController)));
                                    },
                                    backgroundColor: Colors.orange,
                                    child: const Icon(Icons.search)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          tabcontroller(context, provider, tabController)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    ),
  );
}
