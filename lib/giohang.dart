import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartMode.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final cartItems = cartModel.items;

    // Tính tổng số lượng và tổng tiền
    int totalQuantity = cartModel.totalQuantity;
    int totalPrice = cartModel.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        backgroundColor: Colors.teal,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Chưa có sản phẩm nào trong giỏ hàng!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  item.productImage,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.productName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Giá: ${item.productPrice} đ'),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            if (item.quantity > 1) {
                                              cartModel.updateQuantity(
                                                  item.productName,
                                                  item.quantity - 1);
                                            }
                                          },
                                        ),
                                        Text(item.quantity.toString()),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            cartModel.updateQuantity(
                                                item.productName,
                                                item.quantity + 1);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () =>
                                    cartModel.removeItem(item.productName),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng số lượng: $totalQuantity',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tổng tiền: ${totalPrice} đ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Thực hiện hành động thanh toán
                          print('Thanh toán với tổng tiền: $totalPrice đ');
                        },
                        child: Text('Thanh toán'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
