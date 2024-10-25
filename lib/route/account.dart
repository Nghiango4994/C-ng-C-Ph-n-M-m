import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:test/custom/custom_widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _changeProfilePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Nhà sách đam mỹ"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackHome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Thông tin tài khoản',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _imagePath != null
                        ? FileImage(File(_imagePath!)) // Hiển thị ảnh từ file
                        : AssetImage('assets/Nam.png')
                            as ImageProvider, // Ảnh mặc định
                  ),
                  const SizedBox(width: 20),
                  // Sử dụng Flexible để văn bản xuống dòng khi cần
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Họ Tên: Nguyễn Văn A',
                            style: TextStyle(fontSize: 18)),
                        Text('Ngày Sinh: 01/01/1990',
                            style: TextStyle(fontSize: 18)),
                        Text('Giới Tính: Nam', style: TextStyle(fontSize: 18)),
                        Text('Địa Chỉ: 123 Đường ABC, TP.HCM',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Căn trái cho Row
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 27.0), // Căn lề trái 30dp
                    child: SizedBox(
                      width: 160, // Chiều rộng của nút
                      child: ElevatedButton(
                        onPressed: _changeProfilePicture,
                        child: const Text('Đổi Ảnh Đại Diện'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
