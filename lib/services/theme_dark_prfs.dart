// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class DarkthemePrfs {
  setDarkTheme(bool value) async {
    const THEME_STATUS = 'THEME_STATUS';
    SharedPreferences prefrs = await SharedPreferences.getInstance();
    prefrs.setBool(THEME_STATUS, value);
  }

  Future<bool> gettheme() async {
    SharedPreferences prefrs = await SharedPreferences.getInstance();
    return prefrs.getBool('THEME_STATUS') ?? false;
  }
}
