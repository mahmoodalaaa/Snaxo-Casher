import 'package:flutter/material.dart';
import 'package:snaxo_chasher/widgts/first_app_bar.dart';
import 'package:snaxo_chasher/widgts/secound_app_bar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: 2,
          child: first_app_bar(),
        ),
        Expanded(
          flex: 1,
          child: secound_app_bar(),
        ),
        
      ],
    );
  }
}

