import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/services/number_change_listener.dart';

import 'mini_clock.dart';

class Digit extends StatefulWidget {
  Digit(this.number);

  final int number;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Digit> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _clocks = List.generate(6, (int index) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: MiniClock(index: index),
      );
    });

    return ChangeNotifierProvider<NumberChangeListener>(
      create: (_) => NumberChangeListener(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4.5,
        child: Consumer<NumberChangeListener>(
          builder: (BuildContext context, NumberChangeListener value, Widget child) {
            value.setNumber(widget.number);
            return GridView.count(
              primary: true,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: _clocks,
            );
          },
        ),
      ),
//        floatingActionButton: Consumer<NumberChangeListener>(
//          builder: (BuildContext context, value, Widget child) {
//            return FloatingActionButton(
//              onPressed: () {
//                value.setNumber(Random().nextInt(9));
//              },
//            );
//          },
//        ),
    );
  }
}
