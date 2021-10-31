import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    //return false;
    return prefs.getString("user") != null ? true : false;
  }

  static setLoginDetails(String? token) async {
    final prefs = await SharedPreferences?.getInstance();

    // Map<String, dynamic> user = {
    //   'login_name': 'admin',
    //   'login_password': 'admin'
    // };

    await prefs.setString('user', token!);
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
