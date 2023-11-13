import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/enum_auth_provider_keys.dart';

class AuthProvider extends GetxController {
  int userId = 0;
  String userName = '';
  String userEmail = '';
  bool userIsAdmin = false;
  String userToken = '';

  String getToken() {
    return userToken;
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt(AuthProviderKeys.userId.value) ?? 0;
    userName = prefs.getString(AuthProviderKeys.userName.value) ?? '';
    userEmail = prefs.getString(AuthProviderKeys.userEmail.value) ?? '';
    userIsAdmin = prefs.getBool(AuthProviderKeys.userIsAdmin.value) ?? false;
    userToken = prefs.getString(AuthProviderKeys.userToken.value) ?? '';
  }

  void setData({
    required int userId,
    required String userName,
    required String userEmail,
    required bool userIsAdmin,
    required String userToken,
  }) async {
    this.userId = userId;
    this.userName = userName;
    this.userEmail = userEmail;
    this.userIsAdmin = userIsAdmin;
    this.userToken = userToken;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(AuthProviderKeys.userId.value, userId);
    await prefs.setString(AuthProviderKeys.userName.value, userName);
    await prefs.setString(AuthProviderKeys.userEmail.value, userEmail);
    await prefs.setBool(AuthProviderKeys.userIsAdmin.value, userIsAdmin);
    await prefs.setString(AuthProviderKeys.userToken.value, userToken);
  }

  void clearData() async {
    userId = 0;
    userName = '';
    userEmail = '';
    userIsAdmin = false;
    userToken = '';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(AuthProviderKeys.userId.value, 0);
    await prefs.setString(AuthProviderKeys.userName.value, '');
    await prefs.setString(AuthProviderKeys.userEmail.value, '');
    await prefs.setBool(AuthProviderKeys.userIsAdmin.value, false);
    await prefs.setString(AuthProviderKeys.userToken.value, '');
  }
}
