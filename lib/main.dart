import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:test/route/ChiTietSanPham.dart';
import 'route/TrangChu.dart';
import 'route/SingUp.dart';
import 'route/Login.dart';
import 'route/Cart.dart';
import 'route/account.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  const MyCustomScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MyCustomScrollBehavior(),
      initialRoute: "/account",
      routes: {
        '/login': (context) => const Login(),
        '/singup': (context) => const SingUp(),
        '/home': (context) => const Trangchu(),
        '/infor': (context) => const Infor(),
        '/cart': (context) => CartPage(),
        '/account': (context) => const AccountPage()
      },
    );
  }
}
