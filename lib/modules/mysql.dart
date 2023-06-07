import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost',
                user = 'root',
                password = 'Adham155',
                db = 'res';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection?> getConnection() async {
    final settings = ConnectionSettings(
      host: host,
      port: port, // Default MySQL port
      user: user,
      password: password,
      db: db,
    );

    try {
      final connection = await MySqlConnection.connect(settings);
      return connection;
    } catch (e) {
      print('Connection error: $e');
      return null;
    }
  }
}