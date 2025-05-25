import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Repo/Product_menu_repo.dart';
import 'package:snaxo_chasher/widgts/item_menu_body.dart';

class secound_app_bar extends StatelessWidget {
  const secound_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Order Menu"),
        actions: [
          GestureDetector(
            onTap: (){
              context.read<ProductMenuRepo>().clearProducts();
            },
          child: Image.asset("images/reset.png", width: 25)),
          SizedBox(width: 25),
        ],
      ),
      body: item_menu_body(),
    );
  }
}
