import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

void main() {
  runApp(const OrderTrackingPage());
}

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  // int _currentPageIndex = 0; // Index to track current page
  final List<bool> _isSelected = [
    true,
    false,
    false
  ]; // Track selection state for each tab

  final PageController _pageController =
      PageController(); // PageController to control PageView

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildTabs(),
              ),
            ),
            Expanded(
              child: PageView(
                controller:
                    _pageController, // Attach PageController to PageView
                onPageChanged: (index) {
                  setState(() {
                    // _currentPageIndex = index;
                    _updateSelection(index);
                  });
                },
                children: _buildPages(),
              ),
            ),
          ],
        ),
      ),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(color: Color(0xFF12CF8A)),
      ),
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < _isSelected.length; i++) {
      tabs.add(_buildTabItem(i));
    }
    return tabs;
  }

  Widget _buildTabItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // _currentPageIndex = index;
          _updateSelection(index);
          _pageController.jumpToPage(index); // Jump to the selected page
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  _isSelected[index] ? const Color(0xFF12CF8A) : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          _getPageTitle(index),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isSelected[index] ? const Color(0xFF12CF8A) : Colors.black,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      const OrderStatusPage(title: 'To Ship'),
      const OrderStatusPage(title: 'To Receive'),
      const OrderStatusPage(title: 'Received'),
    ];
  }

  void _updateSelection(int index) {
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = (i == index);
    }
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'To Ship';
      case 1:
        return 'To Receive';
      case 2:
        return 'Received';
      default:
        return '';
    }
  }
}

// Example page content for each status
class OrderStatusPage extends StatelessWidget {
  final String title;

  const OrderStatusPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
