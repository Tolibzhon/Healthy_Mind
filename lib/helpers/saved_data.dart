import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<void> setHomeDate(String smile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('HomeDate', smile);
  }

  static Future<String> getHomeDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('HomeDate') ?? '';
  }

  static Future<void> setMeetDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('MeetDate', date);
  }

  static Future<String> getStatedDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('StatedDate') ?? '';
  }

  static Future<void> setStatedDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('StatedDate', date);
  }
}
