import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Repo/Product_menu_repo.dart';
import 'package:snaxo_chasher/Repo/Product_repo.dart';
import 'package:snaxo_chasher/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductRepo()),
        ChangeNotifierProvider(create: (_) => ProductMenuRepo()),
      ],
      child: SnaxoApp(),
    ),
  );
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