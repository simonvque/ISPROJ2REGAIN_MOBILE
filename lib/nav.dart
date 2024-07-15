import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/chatfeatures/inbox.dart';
import 'package:regain_mobile/features/screens/favorites.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/features/screens/offer/offer_list_page.dart';
import 'package:regain_mobile/routes/route_manager.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  List<Widget> body = [
    const HomepageScreen(),
    const FavoritesScreen(),
    const Placeholder(color: Colors.transparent),
    OfferListPage(),
    const Placeholder(color: Colors.transparent),
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
            icon: Icon(CupertinoIcons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add, color: Colors.transparent),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
