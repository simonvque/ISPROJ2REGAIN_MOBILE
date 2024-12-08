import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/favorites.dart';
import 'package:regain_mobile/features/screens/homepage/homepage.dart';
import 'package:regain_mobile/features/screens/offer/offer_list_page.dart';
import 'package:regain_mobile/routes/route_manager.dart';

import 'features/screens/chatfeatures/chat_service.dart';
import 'features/screens/chatfeatures/room_list.dart';
import 'provider/app_data_provider.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Fetch userId from AppDataProvider
    final userId = Provider.of<AppDataProvider>(context, listen: false).userId;

    // Updated body list
    List<Widget> body = [
      const HomepageScreen(),
      const FavoritesScreen(),
      const Placeholder(color: Colors.transparent),
      OfferListPage(),
      userId != null
          ? ChangeNotifierProvider(
              create: (context) => ChatService(),
              child: RoomListScreen(
                userId: userId.toString(),
              ),
            )
          : const Center(
              child: Text("Error: User is not logged in!"),
            ),
    ];

    return Scaffold(
      body: SafeArea(
        child: body[_currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: white,
        backgroundColor: green,
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to the Add Product route
          Navigator.pushNamed(context, RouteManager.routeAddProduct);
        },
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: green,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add, color: Colors.transparent),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
