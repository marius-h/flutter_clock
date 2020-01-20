import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int _firstDigit = 0;
  int _secondDigit = 0;
  int _thirdDigit = 0;
  int _fourthDigit = 0;

  void updateTime(DateTime time) {
//    _firstDigit = int.parse(time.hour.toString().substring(0, 0));
//    _secondDigit = int.parse(time.hour.toString().substring(1, 1));
//    _firstDigit = int.parse(time.minute.toString().substring(0, 0));
//    _secondDigit = int.parse(time.minute.toString().substring(1, 1));
    notifyListeners();
  }

  int get firstDigit => _firstDigit;

  int get secondDigit => _secondDigit;

  int get thirdDigit => _thirdDigit;

  int get fourthDigit => _fourthDigit;
}
