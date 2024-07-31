import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/mypic.jpg'), // Replace with your profile image
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Delower Hossain Dipu',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 37),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildProfileButton(Icons.edit, 'Edit Profile', () {
                    // Navigate to edit profile page
                  }),
                  _buildProfileButton(Icons.location_on, 'Shopping Address', () {
                    // Navigate to shopping address page
                  }),
                  _buildProfileButton(Icons.favorite, 'Wishlist', () {
                    // Navigate to wishlist page
                  }),
                  _buildProfileButton(Icons.history, 'Order History', () {
                    // Navigate to order history page
                  }),
                  _buildProfileButton(Icons.notifications, 'Notifications', () {
                    // Navigate to notifications page
                  }),
                  _buildProfileButton(Icons.credit_card, 'Card', () {

                  }),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileButton(IconData icon, String title, VoidCallback onPressed) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontSize: 18.0, color: Colors.black87)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onPressed,
      ),
    );
  }
}
