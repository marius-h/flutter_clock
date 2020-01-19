import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:tuple/tuple.dart';

import 'mini_clock.dart';

class Clock extends StatefulWidget {
  Clock(this.hourDigits, this.minutesDigits);

  final Tuple2 hourDigits;
  final Tuple2 minutesDigits;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _clocks = List.generate(66, (int index) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: ChangeNotifierProvider<NumberChangeListener>(
          child: MiniClock(index: index),
          create: (_) => NumberChangeListener(),
        ),
      );
    });

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        primary: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        crossAxisCount: 11,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: _clocks,
      ),
    );
  }
}
