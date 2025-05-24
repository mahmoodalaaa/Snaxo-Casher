import 'package:flutter/foundation.dart';
import 'package:snaxo_chasher/Model/Product.dart';
import 'package:snaxo_chasher/Model/Product_catigory.dart';

class ProductRepo extends ChangeNotifier {

  List<Product> allproducts = [
    
    Product(
      id: 1,
      name: "Snaxo Chasher",
      price: 9.99,
      category: ProductCategory.fruit,
      imageUrl: "images/strawberrys.webp",
      weightInGrams: 80
    ),
    Product(
      id: 1,
      name: "Snaxo Chasher",
      price: 9.99,
      category: ProductCategory.fruit,
      imageUrl: "images/strawberrys.webp",
      weightInGrams: 80
    ),
    Product(
      id: 1,
      name: "Snaxo Chasher",
      price: 9.99,
      category: ProductCategory.fruit,
      imageUrl: "images/strawberrys.webp",
      weightInGrams: 80
    ),
   ];

 List<Product> products = [];

  ProductRepo();

  void getProductsByCategory(ProductCategory category) {
    if (category == ProductCategory.all) {
       products = allproducts;
    }else {
       products= allproducts.where((product) => product.category == category).toList();
    }
    notifyListeners();
  }

}