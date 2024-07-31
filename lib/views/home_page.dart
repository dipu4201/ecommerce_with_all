import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../models/FavoriteProvider.dart';
import '../services/product_service.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/product_slider.dart';
import '../views/favorite_page.dart';
import '../views/cart_page.dart';
import '../views/profile_page.dart';
import '../views/about_us_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final ProductService _productService = ProductService();
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = 'All';
  }

  void _onTapNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping App'),
        backgroundColor: Colors.transparent,
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      bottomNavigationBar: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, _) {
          return BottomNavigation(
            currentIndex: _currentIndex,
            onTap: _onTapNavigation,
            favoriteCount: favoriteProvider.favoriteCount,
          );
        },
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePageContent();
      case 1:
        return FavoritePage();
      case 2:
        return CartPage();
      case 3:
        return ProfilePage();
      default:
        return Container();
    }
  }

  Widget _buildHomePageContent() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['All', ..._productService.getCategories()].map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 190.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
            ),
            items: [
              'https://www.webtoffee.com/wp-content/uploads/2020/05/how-to-use-coupons-deals-and-offers-boost-woocommerce-sales-768x362.jpg',
              'https://aliansoftware.com/wp-content/uploads/2023/06/1686910479_Which-coupon-code-ideas-to-use-to-boost-sales_.jpg',
              'https://www.hostgator.com/blog/wp-content/uploads/2021/12/kohls-friends-and-family-promo-code.png',
              'https://www.coredna.com/files/images/blogs/71/961/ecommerce-promotion-strategies-discounts-coupons.webp?f=png&w=831&h=434',
              'https://st2.depositphotos.com/4171947/6089/v/450/depositphotos_60895851-stock-illustration-red-20-percent-off.jpg',
            ].map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        height: 190.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ProductList(
                products: _selectedCategory == 'All'
                    ? _productService.getProducts()
                    : _productService.getProductsByCategory(_selectedCategory),
                onFavoriteCountChanged: (count) {
                  setState(() {
                    // This callback updates the favorite count in the home page
                  });
                },
                onCartCountChanged: (count) {
                  setState(() {
                    // This callback updates the cart count in the home page
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
