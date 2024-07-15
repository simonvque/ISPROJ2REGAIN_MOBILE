import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';

class OrderTrackingPage extends StatelessWidget{
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          'My Orders',
          tabBar: TabBar(
            unselectedLabelColor: white,
            indicatorWeight: 4.0,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            tabs: const [
              Tab(
                text: 'For delivery',
              ),
              Tab(text: 'For pick up'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
          Placeholder(),
          Placeholder()           
          ]
            ),
        ),
      );
  }
}