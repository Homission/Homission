class Config {
  // Singleton instance
  static final Config _instance = Config._internal();

  // Private constructor
  Config._internal();

  // Public factory
  factory Config() {
    return _instance;
  }

  // Your global variables
  bool isAdmin = false;
  String? userEmail;
}

// Usage: Config().isAdmin, Config().userEmail
