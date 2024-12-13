import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(
    const Profilepage(),
  );
}

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _Profilepagestate();
}

class _Profilepagestate extends State<Profilepage> {
  final currentuser = User.getUserById(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEC9E9),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  width: double.maxFinite,
                  child: const Text(
                    'صفحه کاربر',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Shabnam',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  currentuser.imageurl,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 16),
                Text(
                  currentuser.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Shabnam',
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'کد کاربر : ${currentuser.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Shabnam',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'ایمیل کاربر : ${currentuser.email}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Shabnam',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
