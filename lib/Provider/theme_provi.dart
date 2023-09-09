import 'package:flutter/Material.dart';
import 'package:weathersample/services/theme_dark_prfs.dart';

class DarkthemeProvider with ChangeNotifier {
  DarkthemePrfs darkthemePrfs = DarkthemePrfs();
  bool _darktheme = false;
  bool get getDarktheme => _darktheme;

  set setDarktheme(bool value) {
    _darktheme = value;
    darkthemePrfs.setDarkTheme(value);
    notifyListeners();
  }
}
