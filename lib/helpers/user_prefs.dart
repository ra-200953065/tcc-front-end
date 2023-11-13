import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs2 {
  Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userName = prefs.getString('user_name') ?? '';
    String userEmail = prefs.getString('user_email') ?? '';
    bool userIsAdmin = prefs.getBool('user_is_admin') ?? false;
    String userToken = prefs.getString('user_token') ?? '';

    return {
      'user_name': userName,
      'user_email': userEmail,
      'user_is_admin': userIsAdmin,
      'user_token': userToken,
    };
  }

  Future<void> setUserData({
    required String userName,
    required String userEmail,
    required bool userIsAdmin,
    required String userToken,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user_name', userName);
    prefs.setString('user_email', userEmail);
    prefs.setBool('user_is_admin', userIsAdmin);
    prefs.setString('user_token', userToken);
  }

  Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user_name', '');
    prefs.setString('user_email', '');
    prefs.setBool('user_is_admin', false);
    prefs.setString('user_token', '');
  }
}
