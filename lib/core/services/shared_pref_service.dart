import 'package:shared_preferences/shared_preferences.dart';

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

  /// Onboarding Status Methods
  Future<void> setOnboardingStatus() async {
    final prefs = await _instancePrefs;
    prefs.setBool(kOnboardingStatus, true);
  }

  Future<bool> getOnboardingStatus() async {
    final prefs = await _instancePrefs;
    return prefs.getBool(kOnboardingStatus) ?? false;
  }

  /// Sign In Status Methods
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
}
