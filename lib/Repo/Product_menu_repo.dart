import 'package:flutter/foundation.dart';
import 'package:snaxo_chasher/Model/Delevery_type.dart';
import 'package:snaxo_chasher/Model/Product.dart';

class ProductMenuRepo extends ChangeNotifier {

  List <Product> products =[];

  double deleveryPrice = 0.0;

  double totalPrice = 0.0;

  DeleveryType deleveryType = DeleveryType.inGermany;

  ProductMenuRepo();

  void addProduct(Product product) {
    products.add(product);
    getDeleveryPrice();
    getTotalPrice();
    notifyListeners();
  }

  void removeProduct(Product product) {
    products.remove(product);
    getDeleveryPrice();
    getTotalPrice();
    notifyListeners();
  }

  void clearProducts() {
    products.clear();
    deleveryPrice = 0.0;
    totalPrice = 0.0;
    notifyListeners();
  }

  double getPrice() {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice +=product.price ?? 0.0;
    }
    return totalPrice;
  }

  void getDeleveryPrice() {
    
    if(deleveryType == DeleveryType.inGermany ){
      if(getPrice() >= 49) {
        deleveryPrice= 0.0;
      } else {
        deleveryPrice= 4.99;
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

  void setDeleveryType() {
    if(deleveryType == DeleveryType.inGermany){
      deleveryType = DeleveryType.inEurope;
    } else if(deleveryType == DeleveryType.inEurope) {
      deleveryType = DeleveryType.inGermany;
    }
    getDeleveryPrice();
    getTotalPrice();
    notifyListeners();
  }


}
  