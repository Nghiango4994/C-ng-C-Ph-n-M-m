import 'package:flutter/material.dart';
import 'package:test/custom/custom_widgets.dart';

class Trangchu extends StatefulWidget {
  const Trangchu({super.key});

  @override
  State<Trangchu> createState() => TrangchuState();
}

class TrangchuState extends State<Trangchu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Nhà sách đam mẽo'),
      drawer: CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackHome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Điều hướng đến trang Infor
                        Navigator.pushNamed(context, '/infor');
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/tap${index + 1}.png',
                              fit: BoxFit.cover,
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              'Chương ${index + 1}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sách mới',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Điều hướng đến trang Infor
                        Navigator.pushNamed(context, '/infor');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(168, 255, 255, 255),
                          border: Border.all(color: Colors.black, width: 2.0),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/tap${index + 1}.png',
                                width: 50,
                                height: 50,
                              ),
                              title: Text('Trò chơi trí mệnh ${index + 1}'),
                              subtitle: const Text("Giá: 200.000đ"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
