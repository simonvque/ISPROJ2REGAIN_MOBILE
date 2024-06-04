import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/add.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/profile/profile_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  List<Widget> body = const [
    HomepageScreen(),
    Placeholder(color: Colors.transparent),
    Placeholder(color: Colors.transparent),
    Placeholder(color: Colors.transparent),
    Placeholder(color: Colors.transparent),
  ];

  void _onItemTapped(int newIndex) {
    if (newIndex != 2) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: Center(
        child: body[_currentIndex],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF12CF8A),
        child: const Icon(Icons.add),
        onPressed: () => setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        // unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF12CF8A),
        showUnselectedLabels: true,
        // backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (int newIndex) => _onItemTapped(newIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.transparent),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
