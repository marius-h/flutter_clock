import 'package:flutter/material.dart';

// Provider for the current time
class TimeProvider extends ChangeNotifier {
  int _firstDigit = 1;
  int _secondDigit = 3;
  int _thirdDigit = 3;
  int _fourthDigit = -1;

  void updateTime(DateTime time) {
    _firstDigit = time.hour ~/ 10;
    _secondDigit = time.hour % 10;
    _thirdDigit = time.minute ~/ 10;
    _fourthDigit = time.minute % 10;
    notifyListeners();
  }

  int get firstDigit => _firstDigit;

  int get secondDigit => _secondDigit;

  int get thirdDigit => _thirdDigit;

  int get fourthDigit => _fourthDigit;
}
