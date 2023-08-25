import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/model.dart';

class AppProvider extends ChangeNotifier {
  final url = 'https://fakestoreapi.com/products';

  String error = '';
  List<Products> products = [];
  List<FavProducts> favproducts = [];
  List<FavProducts> get favorateproduct => favproducts;
  List<Summary> summary = [];
  List<Summary> get summarydata => summary;

  List<Deliverd> deliveredlist = [];
  List<Deliverd> get deliverditem => deliveredlist;

  getProductDetails() async {
    try {
      Response responce = await Dio().get(url);
      List<dynamic> responseData =
          responce.data; // Assuming the API returns a list of products

      products = responseData.map((data) => Products.fromJson(data)).toList();

      // print(products);
    } catch (e) {
      print(e.toString());
    }
  }

  addFavorate(product) {
    final isExist = favorateproduct.any((element) => element.id == product.id);
    if (isExist) {
    } else {
      favorateproduct.add(product);
      // isok = false;
    }
    notifyListeners();
  }

  clearList() {
    summary.clear();
    notifyListeners();
  }

  addSinglesummary(product) {
    summary.add(product);
    notifyListeners();
  }

  removeFavorate(product) {
    favorateproduct.remove(product);
    notifyListeners();
  }

  bool isExist(products) {
    return favproducts.any((element) => element.id == products.id);
  }

 removeFavSum(productId) {
  favproducts.removeWhere((element) => element.id == productId);
  notifyListeners();
}

  addFavsummary() {
    for (var favProduct in favproducts) {
      // Create a Summary instance from the FavProducts instance
      Summary summaryItem = Summary(
        title: favProduct.title,
        price: favProduct.price,
        description: favProduct.description,
        category: favProduct.category,
        image: favProduct.image,
        rating: favProduct.rating,
        id: favProduct.id, // Replace with the appropriate property
        // Other properties that you want to copy or transform
      );

      // Add the created Summary instance to the summary list
      summary.add(summaryItem);
    }
  }

  addDeliverd() {
    for (var summary in summarydata) {
      // Create a Summary instance from the FavProducts instance
      Deliverd deliverdItem = Deliverd(
        title: summary.title,
        price: summary.price,
        description: summary.description,
        category: summary.category,
        image: summary.image,
        rating: summary.rating,
        id: summary.id, // Replace with the appropriate property
        // Other properties that you want to copy or transform
      );

      // Add the created Summary instance to the summary list
      deliverditem.add(deliverdItem);
    }
  }
}
