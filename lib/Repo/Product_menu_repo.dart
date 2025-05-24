import 'package:flutter/material.dart';
import 'package:snaxo_chasher/Model/Delevery_type.dart';
import 'package:snaxo_chasher/Model/Product.dart';

class ProductMenuRepo extends ChangeNotifier {

  List <Product> products =[];

  double deleveryPrice = 0.0;

  double totalPrice = 0.0;

  ProductMenuRepo();

  List<Product> getProducts() {
    return products;
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }

  void clearProducts() {
    products.clear();
    notifyListeners();
  }

  double getPrice() {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice +=product.price ?? 0.0;
    }
    return totalPrice;
  }

  void getDeleveryPrice(DeleveryType deleveryType) {
    
    if(deleveryType == DeleveryType.inGermany ){
      if(getPrice() >= 49) {
        deleveryPrice= 0.0;
      } else {
        deleveryPrice= 5.99;
      }
    } 
    if(getPrice() >= 105) {
        deleveryPrice= 0.0;
      } 
        deleveryPrice= 7.00;
        notifyListeners();
    } 
       
  void getTotalPrice() {
    totalPrice = getPrice() + deleveryPrice;
    notifyListeners();
  
}
}
  