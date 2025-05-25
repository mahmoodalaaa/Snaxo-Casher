import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Model/Product.dart';
import 'package:snaxo_chasher/Repo/Product_menu_repo.dart';

class item_menu_body extends StatefulWidget {
  const item_menu_body({
    super.key,
  });

  @override
  State<item_menu_body> createState() => _item_menu_bodyState();
}

class _item_menu_bodyState extends State<item_menu_body> {
  @override
  Widget build(BuildContext context) {
    List<Product> products=context.watch<ProductMenuRepo>().products;
    return Column(children: [
        Expanded(
          flex: 3,
          child: ListView.builder(itemCount: products.length,itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
                child: Container(

                 decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 2), // 👈 border color
                   borderRadius: BorderRadius.circular(12),          // 👈 match card radius
                        ),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset("${products[index].imageUrl}", 
                        height: 70,
                        fit: BoxFit.cover),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${products[index].name}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('${products[index].price}€', style: TextStyle(fontSize: 14)),
                            Text('${products[index].weightInGrams}g', style: TextStyle(fontSize: 14))
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.read<ProductMenuRepo>().removeProduct(products[index]);
                                },
                                child: Card(
                                 color: Colors.pinkAccent,
                                   child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.delete, color:Colors.white, size: 25)),
                                    
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            );
          },),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                 width: double.infinity,
                height: 45,
                 decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 2), 
                   borderRadius: BorderRadius.circular(12),          
                        ),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Delevery Price:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("${context.watch<ProductMenuRepo>().deleveryPrice}€",style: TextStyle(fontSize: 16),)
                    ],
                  ),
              ),
              SizedBox(height: 12),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),  
                   color: Colors.pinkAccent,
                        ),
                    height: 70,
                    width: 150,
                    
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${context.watch<ProductMenuRepo>().totalItems} items", style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),),
                            Text("${context.watch<ProductMenuRepo>().totalPrice}€" , style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<ProductMenuRepo>().setDeleveryType();
                       context.read<ProductMenuRepo>().changFlag();
                    },
                    child: SizedBox(
                      width: 50,
                      
                      child: Image.asset("${context.watch<ProductMenuRepo>().flag}",
                      
                      fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
    ],);
  }
}
