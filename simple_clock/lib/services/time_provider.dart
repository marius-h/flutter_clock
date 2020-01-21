import 'package:flutter/material.dart';

// Provider for the current time
class TimeProvider extends ChangeNotifier {
  int _firstDigit = 1;
  int _secondDigit = 3;
  int _thirdDigit = 3;
  int _fourthDigit = -1;

  void updateTime(DateTime time) {
    //
    notifyListeners();
  }

  int get firstDigit => _firstDigit;

  int get secondDigit => _secondDigit;

  int get thirdDigit => _thirdDigit;

  int get fourthDigit => _fourthDigit;
}
