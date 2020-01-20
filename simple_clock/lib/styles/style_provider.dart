import 'package:flutter/material.dart';
import 'package:simple_clock/styles/style.dart';

class StyleProvider with ChangeNotifier {
  bool isLightTheme;

  StyleProvider({this.isLightTheme});

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  void changeThemeData() {
      isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
