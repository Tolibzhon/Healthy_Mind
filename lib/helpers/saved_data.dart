import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<void> setSmileDate(String smile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('SmileDate', smile);
  }

  static Future<String> getSmileDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('SmileDate') ?? '';
  }

  static Future<void> setTextSmileDate(String textSmile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('TextSmileDate', textSmile);
  }

  static Future<String> getTextSmileDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('TextSmileDate') ?? '';
  }

  static Future<void> setQuotesDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('QuotesDate', date);
  }

  static Future<String> getQuotesDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('QuotesDate') ?? '';
  }
}
