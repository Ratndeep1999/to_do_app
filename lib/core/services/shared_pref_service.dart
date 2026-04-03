class SharedPrefService {
  /// Singleton
  static final SharedPrefService _instance = SharedPrefService.internal();

  SharedPrefService.internal();

  factory SharedPrefService() => _instance;
}
