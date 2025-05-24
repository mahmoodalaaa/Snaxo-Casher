import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Model/Product.dart';
import 'package:snaxo_chasher/Model/Product_catigory.dart';
import 'package:snaxo_chasher/Repo/Product_repo.dart';

class list_products_widgt extends StatefulWidget {
  const list_products_widgt({super.key});

  @override
  State<list_products_widgt> createState() => _list_products_widgtState();
}

class _list_products_widgtState extends State<list_products_widgt> {
  @override
   void initState() {
    super.initState();
    // Load products only once when the widget is inserted into the tree
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductRepo>().getProductsByCategory(ProductCategory.all);
    });
  }

  Widget build(BuildContext context) {
   List<Product> products= context.watch<ProductRepo>().products;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Products',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
            clipBehavior: Clip.none,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.75, 
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // add the product to the Product Menu Repo
                      print(index);
                      // this will be insid the drower 
                         // context.read<ProductRepo>().getProductsByCategory(ProductCategory.fruit);
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset('${products[index].imageUrl}',
                              ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${products[index].name}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("${products[index].price}€", style: TextStyle(fontSize: 12)),
                              Text("${products[index].weightInGrams}g", style: TextStyle(fontSize: 12)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
