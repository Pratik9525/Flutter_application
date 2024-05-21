import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_provider.dart'; // Import the FavoriteProvider class
import 'product_list.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ProductItem(product: favoriteProducts[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            product.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  // product.price,
                  '\$${product.price}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
