import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/CartProvider.dart';
import '../models/product.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemTile(
                  cartItem: cartProvider.cartItems[index],
                  onDelete: () {
                    cartProvider.removeFromCart(cartProvider.cartItems[index]);
                  },
                );
              },
            ),
          ),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final Product cartItem;
  final VoidCallback onDelete;

  CartItemTile({required this.cartItem, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Image.network(cartItem.imageUrl),
        title: Text(cartItem.name),
        subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Item'),
                  content: Text('Are you sure you want to delete this item?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Delete'),
                      onPressed: () {
                        onDelete();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double total = cartProvider.totalAmount;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement payment functionality
            },
            child: Text('Proceed to Payment'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
