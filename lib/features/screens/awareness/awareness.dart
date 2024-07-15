import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

class AwarenessFeature extends StatefulWidget {
  const AwarenessFeature({super.key});

  @override
  State<AwarenessFeature> createState() => _AwarenessFeatureState();
}

class _AwarenessFeatureState extends State<AwarenessFeature> {
  final List<bool> _isSelected = [
    true,
    false,
    false,
    false
  ]; // Track selection state for each tab

  final PageController _pageController =
      PageController(); // PageController to control PageView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'The Green Zone',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat-Bold',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildCaptionTitle(context),
          //const Divider(),
          // _buildTabBar(context)
          Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.grey.shade400),
              bottom: BorderSide(color: Colors.grey.shade400),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildTabs(),
            ),
          ),
          // const Divider(),
          Expanded(
            child: PageView(
              controller: _pageController, // Attach PageController to PageView
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
    );
  }

  Widget _buildCaptionTitle(BuildContext context) => Container(
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 0),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Welcome to ReGain',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('The Green Zone',
                        style: TextStyle(
                          color: green,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat-Medium',
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Your gateway to environmental awareness and action as you discover eco-friendly tips, stay updated with environmental news, find helpful websites, and explore upcoming events. Let's work together for a greener community!",
                style: TextStyle(
                  fontSize: 11.0,
                  //color: black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      );

  // Widget _buildTabBar(BuildContext context) => MaterialApp(
  //       home: AwarenessTabController(),
  //     );

  // Widget _buildTabBar(BuildContext context) => Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [_buildTabs()],
  //     );

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
              color: _isSelected[index] ? green : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(
          _getPageTitle(index),
          style: TextStyle(
            fontSize: 12,
            color: _isSelected[index] ? green : black,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      const AwarenessStatusPage(title: 'Tips & Guides'),
      const AwarenessStatusPage(title: 'News'),
      const AwarenessStatusPage(title: 'Website Locator'),
      const AwarenessStatusPage(title: 'Events'),
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
        return 'Tips & Guides';
      case 1:
        return 'News';
      case 2:
        return 'Website Locator';
      case 3:
        return 'Events';
      default:
        return '';
    }
  }
}

class AwarenessStatusPage extends StatelessWidget {
  final String title;

  const AwarenessStatusPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
