import 'package:flutter/material.dart';
import 'package:test/custom/custom_widgets.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nhà sách đam mỹ'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Giỏ hàng của bạn đang trống',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: CustomBottomNav());
  }
}
