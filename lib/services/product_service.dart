// services/product_service.dart
import '../models/product.dart';

class ProductService {
  List<Product> getProducts() {
    return [
      Product(id: '1', name: 'Heady Shoes', category: 'Shoes', description: 'These shoes are awesome', price: 29.99, imageUrl: 'https://magictoolbox.sirv.com/images/magicscroll/allstar-3-1a.jpg'),
      Product(id: '2', name: 'Sneakers Shoes', category: 'Shoes', description: 'Casual Converse Stylish and Comfortable Attractive Design', price: 19.99, imageUrl: 'https://images.othoba.com/images/thumbs/0543853_comfortable-sports-sneakers-shoes-for-men.jpeg'),
      Product(id: '3', name: 'Premium Shirt', category: 'Shirt', description: 'Its a cool looking shirt', price: 39.99, imageUrl: 'https://www.styleex.com.bd/images/detailed/229/e543d21fa505af4b28b92385a1d553d2.jpeg'),
      Product(id: '4', name: 'Hot Shirt', category: 'Shirt', description: 'Looking so cool shirt', price: 49.99, imageUrl: 'https://www.styleex.com.bd/images/detailed/229/48d0ea6931d4addd5235ae1e0419eabd.jpeg'),
      Product(id: '5', name: 'Formal Shirt', category: 'Shirt', description: 'This formal shirt looks professional', price: 59.99, imageUrl: 'https://assets.ajio.com/medias/sys_master/root/20240425/mtnE/662a4cb916fd2c6e6ad1a579/-473Wx593H-464678722-blue-MODEL.jpg'),
      Product(id: '6', name: 'Jeans Pant', category: 'Pant', description: 'Hot Looking Pant', price: 69.99, imageUrl: 'https://toptenmartltd.com/wp-content/uploads/2024/02/Cargo-2-2.jpg'),
      Product(id: '7', name: 'Short', category: 'Pant', description: 'RUNNERS HIGH 2N1 SHORT', price: 79.99, imageUrl: 'https://www.bn3th.com/cdn/shop/files/ss23-sport-runners-high-short-black-M521012-028-front.jpg?v=1695670500&width=1400'),
      Product(id: '8', name: 'Classics Sunglasses', category: 'Sunglasses', description: 'Hipsterkid Baby Sunglasses allow babies to enjoy and explore a big', price: 89.99, imageUrl: 'https://lilyvalleybaby.com/cdn/shop/products/52ef8f7b1fe46e5e07fc507f7bb8c58cf79a4d59233df8b3772786bc33b92605.jpg?v=1684352194'),
      Product(id: '9', name: 'Cool T Shirt', category: 'Tshirt', description: 'Deep Cool', price: 99.99, imageUrl: 'https://www.jiomart.com/images/product/original/rvowvf0akl/eyebogler-teal-tshirts-men-tshirt-tshirt-for-men-tshirt-mens-tshirt-men-s-polo-neck-regular-fit-half-sleeves-colorblocked-t-shirt-product-images-rvowvf0akl-0-202402121853.jpg?im=Resize=(600,750)'),
      Product(id: '10', name: 'HipHop Cap', category: 'Cap', description: 'looking good hiphop cap', price: 109.99, imageUrl: 'https://images-cdn.ubuy.co.in/633b59e5cb77395a6d7f29d4-leeya-n05-hipster-tide-brand-hip-hop.jpg'),
    ];
  }

  List<String> getCategories() {
    return ['Shoes', 'Shirt', 'Pant', 'Sunglasses', 'Tshirt', 'Cap'];
  }

  List<Product> getProductsByCategory(String category) {
    return getProducts().where((product) => product.category == category).toList();
  }
}
