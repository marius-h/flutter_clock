import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/screens/clock_screen.dart';
import 'package:simple_clock/services/time_provider.dart';

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
      home: ChangeNotifierProvider<TimeProvider>(
        create: (_) => TimeProvider(),
        child: ClockScreen(),
      ),
    );
  }
}
