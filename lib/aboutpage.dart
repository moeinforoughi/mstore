import 'package:flutter/material.dart';

void main() {
  runApp(
    const Aboutpage(),
  );
}

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _Aboutpage();
}

class _Aboutpage extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEC9E9),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  label: const Text('aboutpage'),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
