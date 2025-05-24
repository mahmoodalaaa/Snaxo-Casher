
import 'package:flutter/material.dart';

class first_app_bar extends StatelessWidget {
  const first_app_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(),
    );
  }
}