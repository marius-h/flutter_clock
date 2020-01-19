import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/clock.dart';
import 'package:tuple/tuple.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ClockModel>(
          builder: (BuildContext context, ClockModel value, Widget child) {
            final hour =
            DateFormat(value.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
            final String minute = DateFormat('mm').format(_dateTime);
            print(hour);
            print(minute);
            final hourDigits = Tuple2.fromList(hour.split(''));
            final minutesDigits = Tuple2.fromList(minute.split(''));

            return Clock(hourDigits, minutesDigits);
          },
        ),

    );
  }
}
