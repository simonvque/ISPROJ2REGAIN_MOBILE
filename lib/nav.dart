import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/chatfeatures/inbox.dart';
import 'package:regain_mobile/features/screens/favorites.dart';
import 'package:regain_mobile/features/screens/filter.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';

import 'add/add.dart';
class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  List<Widget> body = const [
    HomepageScreen(),
    FavoritesScreen(),
    Placeholder(color: Colors.transparent),
    InboxScreen(),
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
      resizeToAvoidBottomInset:
          false, // This makes floating action bottom to stay in place instead of rising when keyboard pops up
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
