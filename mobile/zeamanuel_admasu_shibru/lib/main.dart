import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/add_product_page.dart';
import 'screens/product_details_page.dart';
import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomePage());

          case '/add':
            return MaterialPageRoute(builder: (_) => const AddProductPage());

          case '/details':
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (_) => ProductDetailsPage(product: product),
            );

          default:
            return null;
        }
      },
    );
  }
}
