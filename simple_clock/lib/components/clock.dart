import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/mini_clock.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:simple_clock/styles/style_provider.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  List<ClockStateListener> _changeListeners = [];

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context);
    final List<Widget> _clocks = List.generate(66, (int index) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: ChangeNotifierProvider<ClockStateListener>(
          child: MiniClock(),
          create: (_) {
            final ClockStateListener n = ClockStateListener();
            _changeListeners.add(n);
            return n;
          },
        ),
      );
    });

    return Scaffold(
      backgroundColor: styleProvider.getThemeData.backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          primary: true,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          crossAxisCount: 11,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          children: _clocks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int index = math.Random().nextInt(_changeListeners.length);
          _changeListeners[index].setClockState(ClockState.north_west);
        },
      ),
    );
  }
}
