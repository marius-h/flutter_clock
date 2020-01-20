import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int _firstDigit = 1;
  int _secondDigit = 3;
  int _thirdDigit = 3;
  int _fourthDigit = 7;

  void updateTime(DateTime time) {
   // _firstDigit = int.parse(time.hour.toString().substring(0, 0));
   // _secondDigit = int.parse(time.hour.toString().substring(1, 1));
   // _firstDigit = int.parse(time.minute.toString().substring(0, 0));
   // _secondDigit = int.parse(time.minute.toString().substring(1, 1));
    notifyListeners();
  }

  int get firstDigit => _firstDigit;

  int get secondDigit => _secondDigit;

  int get thirdDigit => _thirdDigit;

  int get fourthDigit => _fourthDigit;
}
