import 'package:flutter/material.dart';
import 'package:snaxo_chasher/home_screen.dart';

void main() {
  runApp(const SnaxoApp());
}
class SnaxoApp extends StatelessWidget {
  const SnaxoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}