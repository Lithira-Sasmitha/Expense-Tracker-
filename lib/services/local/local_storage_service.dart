class LocalStorageService {
  // Service wrapper for local storage (SharedPreferences / Hive / SQLite)
  static Future<void> initialize() async {
    // Initialize local database or cache
  }

  Future<void> saveExpense(Map<String, dynamic> data) async {
    // Local persistence logic
  }

  Future<List<Map<String, dynamic>>> getExpenses() async {
    return [];
  }
}
