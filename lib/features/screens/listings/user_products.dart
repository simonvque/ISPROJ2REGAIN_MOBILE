import 'package:flutter/material.dart';

class UserProducts extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const UserProducts({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> item = products[index];
          return const Card(
            child: ListTile(),
          );
        });
  }
}
