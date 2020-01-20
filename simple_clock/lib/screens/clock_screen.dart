import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_clock/components/clock.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
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

  /*
   final hour =
            DateFormat(value.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
            final String minute = DateFormat('mm').format(_dateTime);
            print(hour);
            print(minute);
            final hourDigits = Tuple2.fromList(hour.split(''));
            final minutesDigits = Tuple2.fromList(minute.split(''));
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Clock(),
    );
  }
}
