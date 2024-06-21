import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/profile/model/transactions.dart';

class TransactionsPage extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionsPage({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Transactions'),
      body: transactions.isEmpty
          ? const Center(child: Text('No transactions yet.'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction.item),
                  subtitle: Text(transaction.date),
                  trailing: Text('PHP${transaction.amount.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
