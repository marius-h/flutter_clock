import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:simple_clock/components/mini_clock.dart';
import 'package:simple_clock/screens/clock_screen.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ClockModel>(
        create: (_) => ClockModel(),
        child: ClockScreen(),
      ),
    );
  }
}
