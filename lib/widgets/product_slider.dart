import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/FavoriteProvider.dart';
import '../models/CartProvider.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function(int) onFavoriteCountChanged;
  final Function(int) onCartCountChanged;

  ProductList({
    required this.products,
    required this.onFavoriteCountChanged,
    required this.onCartCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7, // Adjust as per your need
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        Product product = products[index];
        bool isFavorite = favoriteProvider.isFavorite(product);
        bool isInCart = cartProvider.cartItems.contains(product);

        return Card(
          margin: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover, // Ensure the image fills the box
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Text('\$${product.price.toString()}'),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        favoriteProvider.removeFromFavorites(product);
                      } else {
                        favoriteProvider.addToFavorites(product);
                      }
                      // Notify the parent widget about favorite count change
                      onFavoriteCountChanged(favoriteProvider.favoriteCount);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isInCart ? Icons.shopping_cart_outlined : Icons.shopping_cart,
                      color: isInCart ? Colors.green : null,
                    ),
                    onPressed: () {
                      if (isInCart) {
                        cartProvider.removeFromCart(product);
                      } else {
                        cartProvider.addToCart(product);
                      }
                      // Notify the parent widget about cart count change
                      onCartCountChanged(cartProvider.cartCount);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
