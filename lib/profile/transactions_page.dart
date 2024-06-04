import 'package:flutter/material.dart';
import 'package:regain_mobile/profile/app_bar.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Transactions'),
      
    );
  }
}
