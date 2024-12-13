import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'aboutpage.dart';
import 'homepage.dart';
import 'orderspage.dart';
import 'profilepage.dart';
import 'settingpage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PageHome());
  }
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDEC9E9),
        appBar: AppBar(
          title: const Text(
            'ام استور',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Shabnam',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF5A189A),
        ),
        body: const BottomNav());
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Pages for navigation
  final List<Widget> mainPages = [
    const Profilepage(),
    const Orderspage(),
    const Homepage(),
    const Settingpage(),
    const Aboutpage(),
  ];

  int selectedIndex = 2;

  void _onTapSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPages[selectedIndex],
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: const Icon(Icons.person_2),
            title: const Text(
              'پروفایل',
              style: TextStyle(
                fontFamily: 'Shabnam',
              ),
            ),
            backgroundColor: Colors.pink,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_basket),
            title: const Text(
              'سفارشات',
              style: TextStyle(
                fontFamily: 'Shabnam',
              ),
            ),
            backgroundColor: Colors.pink.shade200,
          ),
          BottomBarItem(
            unSelectedColor: Colors.white,
            selectedColor: Colors.white,
            icon: const Icon(Icons.do_not_touch),
            title: const Text(
              '',
              style: TextStyle(
                fontFamily: 'Shabnam',
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text(
              'تنظیمات',
              style: TextStyle(
                fontFamily: 'Shabnam',
              ),
            ),
            backgroundColor: Colors.pink.shade600,
          ),
          BottomBarItem(
            icon: const Icon(Icons.info),
            title: const Text(
              'درباره ما',
              style: TextStyle(
                fontFamily: 'Shabnam',
              ),
            ),
            backgroundColor: Colors.pink.shade800,
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        onTap: (index) => _onTapSelectedIndex(index),
        currentIndex: selectedIndex,
        option: DotBarOptions(
          dotStyle: DotStyle.tile,
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTapSelectedIndex(2);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
