import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartMode.dart';
import 'giohang.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productDescription;

  ProductDetailPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Giá: $productPrice',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              productDescription,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).addItem(
                    CartItem(
                      productName: productName,
                      productImage: productImage,
                      productPrice: productPrice,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
                child: Text('Thêm vào giỏ hàng'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
