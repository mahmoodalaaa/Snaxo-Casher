import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snaxo_chasher/Repo/Product_menu_repo.dart';
import 'package:snaxo_chasher/Repo/Product_repo.dart';
import 'package:snaxo_chasher/home_screen.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to landscape only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
    return  MaterialApp(
      scrollBehavior: NoGlowScrollBehavior() ,
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; 
  }
}