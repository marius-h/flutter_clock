import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TimeProvider extends ChangeNotifier {
  Tuple2<int, int> _hourDigits;
  Tuple2<int, int> _minuteDigits;
  int _firstDigit;
  int _secondDigit;
  int _thirdDigit;
  int _fourthDigit;

  void updateTime(DateTime time) {
    _hourDigits = Tuple2.fromList(time.hour.toString().split(''));
    _minuteDigits = Tuple2.fromList(time.minute.toString().split(''));
    _firstDigit = int.parse(time.hour.toString().substring(0, 0));
    _secondDigit = int.parse(time.hour.toString().substring(1, 1));
    _firstDigit = int.parse(time.minute.toString().substring(0, 0));
    _secondDigit = int.parse(time.minute.toString().substring(1, 1));
    notifyListeners();
  }

  Tuple2<int, int> get hourDigits => _hourDigits;

  Tuple2<int, int> get minuteDigits => _minuteDigits;

  int get firstDigit => _firstDigit;

  int get secondDigit => _secondDigit;

  int get thirdDigit => _thirdDigit;

  int get fourthDigit => _fourthDigit;
}
