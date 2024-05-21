import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_list.dart';
import 'product_detail_screen.dart';
import 'product_card.dart';
import 'theme_provider.dart';
import 'cart_provider.dart';
import 'favorite_provider.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';

class ProductGridScreen extends StatefulWidget {
  @override
  _ProductGridScreenState createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  int currentPage = 0;
  final int itemsPerPage = 12;

  List<Product> getPaginatedProducts() {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage > products.length
        ? products.length
        : startIndex + itemsPerPage;
    return products.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: getPaginatedProducts().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                            product: getPaginatedProducts()[index]),
                      ),
                    );
                  },
                  child: ProductCard(product: getPaginatedProducts()[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  child: Text('Previous'),
                ),
                TextButton(
                  onPressed: (currentPage + 1) * itemsPerPage < products.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
