import 'package:flutter/material.dart';
import 'package:pharmix/screens/cart_screen.dart';
// import 'package:pharmix/screens/order_screen.dart';
// import 'package:pharmix/screens/start_screen.dart';
import 'package:pharmix/screens/product_screen.dart';
// import 'package:pharmix/screens/tab_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: TabScreen(),
      // home: OrderScreen(),
      // home: StartScreen(),
      home: ProductScreen(),
      // home: CartScreen(),
    );
  }
}
