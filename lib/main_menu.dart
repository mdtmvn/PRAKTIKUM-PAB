import 'package:flutter/material.dart';

import 'home_page.dart';
import 'book_page.dart';
import 'api_page.dart';
import 'profile_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    BookPage(),
    ApiPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

        backgroundColor: const Color(0xFFF5F0F7),

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Book"),

          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "API"),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
