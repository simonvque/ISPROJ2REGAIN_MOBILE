import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/chatfeatures/inbox.dart';
import 'package:regain_mobile/features/screens/favorites.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

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
    if (newIndex != 2 && newIndex != 4) {
      setState(() {
        _currentIndex = newIndex;
      });
    } else if (newIndex == 4) {
      Navigator.pushNamed(context, RouteManager.routeProfilePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: white,
        backgroundColor: green,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouteManager.routeAdd);
        },
      ),
      resizeToAvoidBottomInset:
          false, // This makes floating action bottom to stay in place instead of rising when keyboard pops up
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        // unselectedItemColor: gray,
        selectedItemColor: green,
        showUnselectedLabels: true,
        // backgroundColor: white,
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
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
