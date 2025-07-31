import 'package:flutter/material.dart';
import 'package:zeamanuel_admasu_shibru/screens/add_product_page.dart';
import 'package:zeamanuel_admasu_shibru/screens/product_details_page.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.sampleData;

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), // Light gray background
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 20,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "July 14, 2023",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Hello, Zeamanuel",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.qr_code_scanner_rounded),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Title & Search
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Available Products",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.search),
                    )
                  ],
                ),

                const SizedBox(height: 16),

                // Product List
                Expanded(
                  child: ListView.separated(
                    itemCount: products.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index], onTap: () {  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: products[index]),
      ),
    );},);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.indigoAccent,
  shape: const CircleBorder(),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductPage()),
    );
  },
  child: const Icon(Icons.add),
),
    );
  }
}
