class Product {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    
  });

  static List<Product> sampleData = [
    Product(
      name: "Derby Leather Shoes",
      category: "Men's shoe",
      price: 120,
      rating: 4.0,
      imageUrl: 'assets/po.avif',
      description: "aaaaaaaaaaaaaaaaaaaaaaaaaaa"
    ),
    Product(
      name: "Derby Leather Shoes",
      category: "Men's shoe",
      price: 120,
      rating: 4.0,
      imageUrl: 'assets/sho.avif',
      description: "bbbbbbbbbbbbbbbbbbbbbbbbbbbb"
    ),
  ];
}
