import 'package:flutter/material.dart';

class secound_app_bar extends StatelessWidget {
  const secound_app_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Order Menu"),),
    );
  }
}