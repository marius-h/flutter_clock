import 'package:flutter/material.dart';
import 'package:simple_clock/styles/style.dart';


// Provider for theme changes
class StyleProvider with ChangeNotifier {
  bool isLightTheme;

  StyleProvider({this.isLightTheme});

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  void changeThemeData() {
      isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
