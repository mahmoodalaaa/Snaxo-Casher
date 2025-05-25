import 'package:flutter/foundation.dart';
import 'package:snaxo_chasher/Model/Delevery_type.dart';
import 'package:snaxo_chasher/Model/Product.dart';

class ProductMenuRepo extends ChangeNotifier {

  List <Product> products =[];

  double deleveryPrice = 0.0;

  double totalPrice = 0.0;

  int totalItems = 0;

  String flag="images/Germany.png";

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
    totalItems = 0;
    notifyListeners();
  }

  double getPrice() {
    int total=0;
    double totalPrice = 0;
    for (var product in products) {
      totalPrice +=product.price ?? 0.0;
      total +=1;
    }
    totalItems = total;
    notifyListeners();
    return totalPrice;
  }

  void getDeleveryPrice() {
    
    if(deleveryType == DeleveryType.inGermany ){
      if(getPrice() >= 49) {
        deleveryPrice= 0.0;
      } else {
        deleveryPrice= 4.99;
      }
    } else{
    if(getPrice() >= 105) {
        deleveryPrice= 0.0;
      } else{
        deleveryPrice= 7.00;
      }
    }
        notifyListeners();
    } 
       
  void getTotalPrice() {
    double price= getPrice() + deleveryPrice;
    totalPrice = roundToTwoDecimalPlaces(price);
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

  void changFlag(){
    if(flag =="images/Germany.png"){
      flag ="images/europa.png";
    }else {
      flag="images/Germany.png";
    }
    notifyListeners();
  }

}
  double roundToTwoDecimalPlaces(double value) {
  return (value * 100).roundToDouble() / 100;
}