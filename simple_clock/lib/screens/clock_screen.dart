import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/clock.dart';
import 'package:simple_clock/services/time_provider.dart';
import 'package:simple_clock/styles/style_provider.dart';

// time & onTap for switching styles
class ClockScreen extends StatefulWidget {
  ClockScreen({Key key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(TimeProvider timeProvider) {
    _dateTime = DateTime.now();

    timeProvider.updateTime(_dateTime);

    _timer = Timer(
      Duration(minutes: 1) -
          Duration(seconds: _dateTime.second) -
          Duration(milliseconds: _dateTime.millisecond),
      () => _updateTime(timeProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context);

    return Consumer<TimeProvider>(
      builder: (BuildContext context, TimeProvider value, Widget child) {
        _updateTime(value);

        return Scaffold(
          body: GestureDetector(
              onTap: () {
                styleProvider.changeThemeData();
              },
              child: Clock()),
        );
      },
    );
  }
}
