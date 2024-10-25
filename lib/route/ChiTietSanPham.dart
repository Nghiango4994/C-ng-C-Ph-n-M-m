import 'package:flutter/material.dart';
import '../custom/custom_widgets.dart';

class Infor extends StatefulWidget {
  const Infor({super.key});

  @override
  State<Infor> createState() => InforState();
}

class InforState extends State<Infor> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Nhà sách đam mẽo'),
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackHome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Trò chơi trí mệnh chương I",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/tap1.png',
                      fit: BoxFit.cover,
                      height: 180,
                      width: 180,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Loại sản phẩm: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "Sách giáo khoa"),
                              ],
                            ),
                          ),
                          // Add other RichText widgets here...
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Tác giả: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "Nguyễn Văn A"),
                              ],
                            ),
                          ),
                          // Add other RichText widgets here...
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      const Text("200.000đ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Chọn mua",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Thông tin chung: Sách này cung cấp kiến thức cơ bản về các chủ đề quan trọng trong giáo dục, giúp học sinh nắm vững kiến thức và chuẩn bị tốt cho kỳ thi. Nội dung được biên soạn bởi các chuyên gia hàng đầu trong lĩnh vực giáo dục.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation based on index
            if (index == 0) {
              Navigator.pushNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/infor');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/contact');
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Trang chủ",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Giới thiệu",
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: "Liên hệ",
            icon: Icon(Icons.contact_mail),
          ),
        ],
      ),
    );
  }
}
