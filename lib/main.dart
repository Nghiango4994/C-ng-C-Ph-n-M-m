import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'cartMode.dart';
import 'chitietsanpham.dart';
import 'dagnhap.dart';
import 'giohang.dart';

void main() async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class Scroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: Scroll(),
      title: 'Nhà sách CKC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Map<String, String>> cartItems = [];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage()),
      );
    }
  }

  void _onBookTap(
      String title, String price, String imagePath, String description) {
    price = price.replaceAll(' đ', '').replaceAll(',', '').trim();
    double numericPrice = double.parse(price);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          productName: title,
          productImage: imagePath,
          productPrice: numericPrice.toString(),
          productDescription: description,
        ),
      ),
    ).then((addedProduct) {
      if (addedProduct != null) {
        setState(() {
          cartItems.add(addedProduct);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhà sách CKC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.purple,
              child: const DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Danh Mục',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            // Các mục danh sách khác
            ListTile(
                title: const Text('Sách tiếng việt'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('English Books'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('VPP & Học Cụ'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Đồ Chơi'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Phụ Kiện'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Băng Đĩa'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Ưu Đãi Hot'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Sách Giáo Khoa & Dụng Cụ Các Lớp'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: const Text('Outlet Sales'),
                onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200.0,
            child: PageView(
              children: List.generate(10, (int index) {
                String imagePath;
                switch (index % 5) {
                  case 0:
                    imagePath = 'img/book1.jpg';
                    break;
                  case 1:
                    imagePath = 'img/book2.jpg';
                    break;
                  case 2:
                    imagePath = 'img/book3.jpg';
                    break;
                  case 3:
                    imagePath = 'img/1.jpg';
                    break;
                  default:
                    imagePath = 'img/book4.jpg';
                }
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
          const Text('Sách mới'),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => _onBookTap(
                      'Tâm Hồn Cao Thượng',
                      '400,000 đ',
                      'img/book1.jpg',
                      'Cuốn sách này dạy về những giá trị nhân văn cao thượng, giúp con người hướng đến sự bao dung và tình yêu thương.'),
                  child: _buildBookItem(
                    'Tâm Hồn Cao Thượng',
                    '400,000 đ',
                    'img/book1.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () => _onBookTap(
                      'Nhà Giả Kim',
                      '300,000 đ',
                      'img/book2.jpg',
                      'Một tác phẩm nổi tiếng của Paulo Coelho, nói về hành trình tìm kiếm ước mơ của một chàng trai trẻ.'),
                  child: _buildBookItem(
                    'Nhà Giả Kim',
                    '300,000 đ',
                    'img/book2.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () => _onBookTap(
                      'Đắc Nhân Tâm',
                      '350,000 đ',
                      'img/book3.jpg',
                      'Sách kinh điển của Dale Carnegie về cách giao tiếp và gây ảnh hưởng tới người khác.'),
                  child: _buildBookItem(
                    'Đắc Nhân Tâm',
                    '350,000 đ',
                    'img/book3.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () => _onBookTap(
                      'Bí mật tư duy triệu phú',
                      '500,000 đ',
                      'img/book4.jpg',
                      'Sách giúp bạn thay đổi cách tư duy về tiền bạc và hướng dẫn bạn cách xây dựng sự giàu có.'),
                  child: _buildBookItem(
                    'Bí mật tư duy triệu phú',
                    '500,000 đ',
                    'img/book4.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () => _onBookTap(
                      'Sức mạnh của thói quen',
                      '450,000 đ',
                      'img/book5.jpg',
                      'Cuốn sách khám phá cách các thói quen hình thành và làm thế nào để thay đổi chúng nhằm cải thiện cuộc sống.'),
                  child: _buildBookItem(
                    'Sức mạnh của thói quen',
                    '450,000 đ',
                    'img/book5.jpg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Giới thiệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildBookItem(String title, String price, String imagePath) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.all(10),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
