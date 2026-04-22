import 'package:flutter/material.dart';
import 'package:travel_app/home_page.dart';
import 'package:travel_app/my_profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final screens = [HomePage(), MyProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.indigo,
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: Color(0xff0923b5),
          ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            // BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: 'History'),
            // BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
