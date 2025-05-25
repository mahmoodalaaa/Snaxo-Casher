
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Model/Product_catigory.dart';
import 'package:snaxo_chasher/Repo/Product_repo.dart';
import 'package:snaxo_chasher/widgts/list_products_widgt.dart';

class first_app_bar extends StatelessWidget {
  const first_app_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Image.asset("images/logo.png"),
              SizedBox(height: 25,),
              Text("Catigories:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,)),
                SizedBox(height: 5,),

                GestureDetector(
                  onTap: () {
                     Provider.of<ProductRepo>(context, listen: false)
      .getProductsByCategory(ProductCategory.all);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                        height: 40,
                        width: 600,
                        color: Colors.grey[200],
                         child:  Center(child: Text("All")),),
                        
                ),
                SizedBox(height: 3,),
                GestureDetector(
                  onTap: () {
                       Provider.of<ProductRepo>(context, listen: false)
      .getProductsByCategory(ProductCategory.fruit);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                        height: 40,
                        width: 600,
                        color: Colors.grey[200],
                        child:  Center(child: Text("Fruit"))),
                        
                ),
                 SizedBox(height: 3,),
                GestureDetector(
                  onTap: () {
                       Provider.of<ProductRepo>(context, listen: false)
      .getProductsByCategory(ProductCategory.vegetable);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                        height: 40,
                        width: 600,
                        color: Colors.grey[200],
                        child:  Center(child: Text("Vegetable"))),
                        
                ),
                 SizedBox(height: 3,),
                GestureDetector(
                  onTap: () {
                         Provider.of<ProductRepo>(context, listen: false)
      .getProductsByCategory(ProductCategory.eiscream);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                        height: 40,
                        width: 600,
                        color: Colors.grey[200],
                        child:  Center(child: Text("Eiscream"))),
                        
                ),
                 SizedBox(height: 3,),
                GestureDetector(
                  onTap: () {
                       Provider.of<ProductRepo>(context, listen: false)
      .getProductsByCategory(ProductCategory.candy);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                        height: 40,
                        width: 600,
                        color: Colors.grey[200],
                        child:  Center(child: Text("Candy"))),
                        
                ),
                
                      
            ],
          ),
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.white,),
      body: list_products_widgt(),
    );
  }
}
