import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_list.dart';
import '../providers/cart_provider/cart_provider.dart';
import '../providers/favorite_provider/favorite_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    bool isInCart = cartProvider.cartItems.contains(product);
    bool isFavorite = favoriteProvider.favoriteItems.contains(product);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            product.image,
            height: 210,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text('\$${product.price}',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 10),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  cartProvider.addToCart(product);
                },
                child: Text(
                  isInCart ? 'In Cart' : 'Add to Cart',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  // primary: isInCart ? Colors.green : Colors.blue,
                  backgroundColor: isInCart
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Color.fromARGB(255, 77, 202, 77),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 16,
                ),
                onPressed: () {
                  if (isFavorite) {
                    favoriteProvider.removeFromFavorite(product);
                  } else {
                    favoriteProvider.addToFavorite(product);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
