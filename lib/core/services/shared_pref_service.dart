import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/auth/model/user_model.dart';

class SharedPrefService {
  /// Singleton
  static final SharedPrefService _instance = SharedPrefService.internal();

  SharedPrefService.internal();

  factory SharedPrefService() => _instance;

  static SharedPreferences? _prefs;

  /// Get Instance
  Future<SharedPreferences> get _instancePrefs async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  /// Keys
  static const String kOnboardingStatus = "onboarding_status";
  static const String kSignInStatus = "sign_in_status";
  static const String kUserData = "user_data";

  /// --------------------Onboarding-------------------------
  Future<void> setOnboardingStatus() async {
    final prefs = await _instancePrefs;
    prefs.setBool(kOnboardingStatus, true);
  }

  Future<bool> getOnboardingStatus() async {
    final prefs = await _instancePrefs;
    return prefs.getBool(kOnboardingStatus) ?? false;
  }

  /// --------------------Sign In-------------------------
  Future<void> setSignInStatus(bool status) async {
    final prefs = await _instancePrefs;
    prefs.setBool(kSignInStatus, status);
  }

  Future<bool> getSignInStatus() async {
    final prefs = await _instancePrefs;
    return prefs.getBool(kSignInStatus) ?? false;
  }

  Future<void> clearLoginStatus() async {
    final prefs = await _instancePrefs;
    prefs.remove(kSignInStatus);
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final user = await getUser();
    if (user == null) return false;
    return user.username == username && user.password == password;
  }

  ///--------------------Sign Up-------------------------
  Future<void> saveUser(UserModel user) async {
    final prefs = await _instancePrefs;
    final userString = jsonEncode(user.toJson());
    prefs.setString(kUserData, userString);
  }

  Future<UserModel?> getUser() async {
    final prefs = await _instancePrefs;
    final userString = prefs.getString(kUserData);

    if (userString != null) {
      final jsonMap = jsonDecode(userString);
      return UserModel.fromJson(jsonMap);
    }
    return null;
  }
}
