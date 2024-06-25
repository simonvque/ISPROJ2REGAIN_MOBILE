import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/controllers/awareness_tab_controller.dart';

class AwarenessFeature extends StatefulWidget {
  const AwarenessFeature({super.key});

  @override
  State<AwarenessFeature> createState() => _AwarenessFeatureState();
}

class _AwarenessFeatureState extends State<AwarenessFeature> {
  // final List<bool> _isSelected = [
  //   true,
  //   false,
  //   false
  // ]; // Track selection state for each tab

  // final PageController _pageController =
  //     PageController(); // PageController to control PageView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Green Zone',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontFamily: 'Montserrat-Bold',
          ),
        ),
        backgroundColor: green,
        iconTheme: const IconThemeData(color: white),
      ),
      body: Column(
        children: <Widget>[
          _buildCaptionTitle(context),
          const Divider(),
          _buildTabBar(context)
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: _buildTabs(),
          //   ),
          // ),
          // Expanded(
          //   child: PageView(
          //     controller: _pageController, // Attach PageController to PageView
          //     onPageChanged: (index) {
          //       setState(() {
          //         // _currentPageIndex = index;
          //         _updateSelection(index);
          //       });
          //     },
          //     children: _buildPages(),
          //   ),
          // ),
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

  Widget _buildTabBar(BuildContext context) => MaterialApp(
        home: AwarenessTabController(),
      );

  // // Widget _buildTabBar(BuildContext context) => Row(
  // //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  // //       children: [_buildTabs()],
  // //     );

  // List<Widget> _buildTabs() {
  //   List<Widget> tabs = [];
  //   for (int i = 0; i < _isSelected.length; i++) {
  //     tabs.add(_buildTabItem(i));
  //   }
  //   return tabs;
  // }

  // Widget _buildTabItem(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         // _currentPageIndex = index;
  //         _updateSelection(index);
  //         _pageController.jumpToPage(index); // Jump to the selected page
  //       });
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         border: Border(
  //           bottom: BorderSide(
  //             color:
  //                 _isSelected[index] ? Color(0xFF12CF8A) : Colors.transparent,
  //             width: 2.0,
  //           ),
  //         ),
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //       child: Text(
  //         _getPageTitle(index),
  //         style: TextStyle(
  //           fontSize: 12,
  //           fontWeight: FontWeight.bold,
  //           color:
  //               _isSelected[index] ? Color(0xFF12CF8A) : Colors.grey.shade700,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // List<Widget> _buildPages() {
  //   return [
  //     AwarenessStatusPage(title: 'Tips & Guides'),
  //     AwarenessStatusPage(title: 'News'),
  //     AwarenessStatusPage(title: 'Website Locator'),
  //     AwarenessStatusPage(title: 'Events'),
  //   ];
  // }

  // void _updateSelection(int index) {
  //   for (int i = 0; i < _isSelected.length; i++) {
  //     _isSelected[i] = (i == index);
  //   }
  // }

  // String _getPageTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'Tips & Guides';
  //     case 1:
  //       return 'News';
  //     case 2:
  //       return 'Website Locator';
  //     case 3:
  //       return 'Events';
  //     default:
  //       return '';
  //   }
  // }
}

// class AwarenessStatusPage extends StatelessWidget {
//   final String title;

//   const AwarenessStatusPage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
//     );
//   }
// }

