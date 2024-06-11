import 'package:mysql1/mysql1.dart';

class Mysql1 {
  // Define your connection settings
  final ConnectionSettings settings = ConnectionSettings(
    host:
        '10.0.2.2', // e.g., '10.0.2.2' for Android emulator, or your server's IP
    port: 3306, // Default MySQL port
    user: 'root',
    password: '772323Shi',
    db: 'regain',
  );

  // Create a singleton instance of DatabaseHelper
  static final Mysql1 instance = Mysql1._privateConstructor();

  Mysql1._privateConstructor();

  Future<MySqlConnection> getConnection() async {
    try {
      print('Attempting to connect to MySQL...');
      return await MySqlConnection.connect(settings);
    } catch (e) {
      print('Error connecting to MySQL: $e');
      rethrow;
    }
  }

  Future<void> testConnection() async {
    MySqlConnection? conn;
    try {
      conn = await getConnection();
      print('Connected to MySQL!');
    } catch (e) {
      print('Connection failed: $e');
    } finally {
      await conn?.close();
    }
  }
}
