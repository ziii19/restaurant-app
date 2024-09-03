import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'restaurant_search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var pages = [
      const HomeScreen(),
      const RestaurantSearchScreen(),
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu_rounded), label: 'Restaurant'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: 'Search')
          ]),
    );
  }
}
