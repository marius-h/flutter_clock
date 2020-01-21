import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/mini_clock.dart';
import 'package:simple_clock/models/digits.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:simple_clock/services/time_provider.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:simple_clock/styles/style_provider.dart';
import 'package:tuple/tuple.dart';

// grid out of Miniclocks
class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  static const int ITEMS_PER_ROW = 11;
  List<ClockStateListener> _changeListeners = [];
  List<Widget> _clocks;
  List<List<Tuple2<double, double>>> _pixelGrid;
  final originHour1 = Point(1, 1);
  final originHour2 = Point(3, 1);
  final originMinute1 = Point(6, 1);
  final originMinute2 = Point(8, 1);

  @override
  void initState() {
    super.initState();
    _changeListeners = List.generate(55, (_) => ClockStateListener());

    _clocks = List.generate(55, (int index) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: ChangeNotifierProvider<ClockStateListener>(
          child: MiniClock(),
          create: (_) {
            return _changeListeners[index];
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context);

    _pixelGrid =
        List<List<Tuple2<double, double>>>.generate(ITEMS_PER_ROW, (_) {
      return List<Tuple2<double, double>>.filled(5, ClockState.idle);
    });

    return Scaffold(
      backgroundColor: styleProvider.getThemeData.backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<TimeProvider>(
          builder: (BuildContext context, TimeProvider value, Widget child) {
            _pixelGrid = buildDigit(value.firstDigit, originHour1, _pixelGrid);
            _pixelGrid = buildDigit(value.secondDigit, originHour2, _pixelGrid);
            _pixelGrid =
                buildDigit(value.thirdDigit, originMinute1, _pixelGrid);
            _pixelGrid =
                buildDigit(value.fourthDigit, originMinute2, _pixelGrid);

            for (var i = 0; i < _pixelGrid.length; ++i) {
              for (var j = 0; j < _pixelGrid[i].length; ++j) {
                var o = _pixelGrid[i][j];
                _changeListeners[j * ITEMS_PER_ROW + i].setClockState(o);
              }
            }

            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              primary: true,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              crossAxisCount: 11,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: _clocks,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int index = Random().nextInt(_changeListeners.length);
          _changeListeners[index].setClockState(ClockState.north_west);
        },
      ),
    );
  }
}
