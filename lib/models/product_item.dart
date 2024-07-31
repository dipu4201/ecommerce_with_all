import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import 'FavoriteProvider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final ValueChanged<int> onFavoriteCountChanged;
  final ValueChanged<int> onCartCountChanged;

  ProductItem({
    required this.product,
    required this.onFavoriteCountChanged,
    required this.onCartCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(product);

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
                  fit: BoxFit.cover,
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
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  if (isFavorite) {
                    favoriteProvider.removeFromFavorites(product);
                  } else {
                    favoriteProvider.addToFavorites(product);
                  }
                  onFavoriteCountChanged(favoriteProvider.favoriteCount);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: null,
                ),
                onPressed: () {
                  // Handle adding to cart
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
