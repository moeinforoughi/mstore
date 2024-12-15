import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'data.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernamefield = TextEditingController();
  final TextEditingController _passwordfield = TextEditingController();
  final currentuser = User.getUserById(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEC9E9),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logos/largelogo.png',
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Logos/smalllogo.png',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: _usernamefield,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.black),
                            labelText: 'نام کاربری',
                            labelStyle: const TextStyle(fontFamily: 'Shabnam'),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          controller: _passwordfield,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.key, color: Colors.black),
                            labelText: 'رمز عبور',
                            labelStyle: const TextStyle(fontFamily: 'Shabnam'),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            final username = _usernamefield.text;
                            final password = _passwordfield.text;
                            if (username == currentuser.username &&
                                password == currentuser.password) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PageHome()),
                              );
                            } else {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.error,
                                body: const Center(
                                  child: Text(
                                    'لطفا ورودی ها را به دقت پر کنید',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: 'Shabnam',
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                btnOkOnPress: () {},
                                btnOkText: 'تایید',
                                buttonsTextStyle: const TextStyle(
                                  fontFamily: 'Shabnam',
                                  color: Colors.white,
                                ),
                                btnOkIcon: Icons.check,
                                btnOkColor: Colors.red,
                              ).show();
                            }
                          },
                          label: const Text('ورود',
                              style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 16,
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5A189A),
                            minimumSize: const Size(430, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
