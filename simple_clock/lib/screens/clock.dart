import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/digit.dart';
import 'package:tuple/tuple.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime _dateTime = DateTime.now();
  Timer _timer;


  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ClockModel>(
          builder: (BuildContext context, ClockModel value, Widget child) {
            final hour =
            DateFormat(value.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
            final String minute = DateFormat('mm').format(_dateTime);
            print(hour);
            print(minute);
            final hourDigit = Tuple2.fromList(hour.split(''));
            final minutesDigit = Tuple2.fromList(minute.split(''));

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Digit(int.parse(hourDigit.item1)),
                Digit(int.parse(hourDigit.item2)),
                Digit(int.parse(minutesDigit.item1)),
                Digit(int.parse(minutesDigit.item2)),
              ],
            );
          },
        ),
      ),
    );
  }
}
