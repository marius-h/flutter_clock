import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/screens/clock_screen.dart';
import 'package:simple_clock/services/time_provider.dart';
import 'package:simple_clock/styles/style_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => StyleProvider(isLightTheme: true),
        child: MaterialApp(
          title: 'Analog clocks to digital clock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ChangeNotifierProvider<TimeProvider>(
            create: (_) => TimeProvider(),
            child: ClockScreen(),
          ),
        ));
  }
}
