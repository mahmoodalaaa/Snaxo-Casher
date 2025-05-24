
import 'package:snaxo_chasher/Model/Product_catigory.dart';

class Product{
  int? id;
  String? name;
  double? price;
  ProductCategory? category;
  String? imageUrl;
  int? weightInGrams;

  Product({
    this.id,
    this.name,
    this.price,
    this.category,
    this.imageUrl,
    this.weightInGrams
  }
  );


}