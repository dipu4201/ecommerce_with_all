import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Shopping App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Our Shopping App is designed to provide the best shopping experience. '
                  'We offer a wide range of products, excellent customer service, and a seamless shopping experience.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more content as needed
          ],
        ),
      ),
    );
  }
}
