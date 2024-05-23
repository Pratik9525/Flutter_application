import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider/cart_provider.dart';
import '../widgets/product_list.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartProducts = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(cartProducts[index].image),
                  title: Text(cartProducts[index].name),
                  subtitle: Text('\$${cartProducts[index].price.toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartProvider.removeFromCart(cartProducts[index]);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Price: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
