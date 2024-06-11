import 'package:flutter/material.dart';
import 'package:regain_mobile/mysql1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _testDatabaseConnection();
  }

  void _testDatabaseConnection() async {
    try {
      await Mysql1.instance.testConnection();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySQL Connection Test'),
      ),
      body: Center(
        child: Text('Check console output for connection status.'),
      ),
    );
  }
}
