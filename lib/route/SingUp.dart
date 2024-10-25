import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => SingUpState();
}

class SingUpState extends State<SingUp> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _NumberPhoneController = TextEditingController();
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _PassController = TextEditingController();
  final TextEditingController _RePassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Nhà sách đam mỹ'),
            backgroundColor: Colors.pink,
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BackSingUp.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 35, 17, 17),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(17),
                    child: Text(
                      "ĐĂNG KÝ THÀNH VIÊN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 20, 17, 5),
                    child: TextFormField(
                      controller: _NameController,
                      decoration: const InputDecoration(
                        labelText: 'Họ tên',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 65, 67)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 149)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 204, 3, 3)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ tên';
                        }
                        if (RegExp(r'\d').hasMatch(value)) {
                          return 'Họ tên không được chứa số';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                    child: TextFormField(
                      controller: _NumberPhoneController,
                      decoration: const InputDecoration(
                        labelText: 'Số điện thoại',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 65, 67)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 149)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 204, 3, 3)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Số điện thoại không được chứa chữ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                    child: TextFormField(
                      controller: _UserNameController,
                      decoration: const InputDecoration(
                        labelText: 'Tên đăng nhập..',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 65, 67)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 149)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 204, 3, 3)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ tên';
                        }
                        if (RegExp(r'\d').hasMatch(value)) {
                          return 'Họ tên không được chứa số';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                    child: TextFormField(
                      controller: _PassController,
                      decoration: const InputDecoration(
                        labelText: 'Mật khẩu..',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 65, 67)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 149)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 204, 3, 3)),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        if (value.length < 8) {
                          return 'Độ dài mật khẩu tối thiểu 8 chữ số';
                        }
                        if (value.length > 20) {
                          return 'Độ dài mật khẩu tối đa 20 chữ số';
                        }
                        return null;
                      },
                      onChanged: (value) => _password = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                    child: TextFormField(
                      controller: _RePassController,
                      decoration: const InputDecoration(
                        labelText: 'Nhập lại mật khẩu..',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 65, 67)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 149)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 204, 3, 3)),
                        ),
                      ),
                      onChanged: (value) => _confirmPassword = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập lại mật khẩu';
                        }
                        if (_confirmPassword != _password) {
                          return 'Mật khẩu không chính xác';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 30, 17, 5),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context, '/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        side: const BorderSide(color: Colors.black, width: 2),
                      ).copyWith(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.pink;
                            }
                            return Colors.white;
                          },
                        ),
                        foregroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.white;
                            }
                            return Colors.pink;
                          },
                        ),
                      ),
                      child: const Text('Đăng ký'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 0, 212),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
