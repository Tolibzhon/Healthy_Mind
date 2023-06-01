import 'dart:convert';

import 'package:healthy_mind/config/root_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootDataSource {
  static const String key = 'root';
  Future<bool> saveRoot(Map<dynamic, dynamic> root) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString(key, jsonEncode(root));
    return result;
  }

  Future<RootModel?> getRoot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? rootPref = prefs.getString(key);
    if (rootPref != null) {
      Map<dynamic, dynamic> rootMap =
          jsonDecode(rootPref) as Map<dynamic, dynamic>;
      return RootModel.fromJson(rootMap);
    }
    return null;
  }
}
