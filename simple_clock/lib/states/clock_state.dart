import 'package:tuple/tuple.dart';

// all clock states
class ClockState {
  static const north_north = const Tuple2<double, double>(0, 0);
  static const east_east = const Tuple2<double, double>(15, 15);
  static const south_south = const Tuple2<double, double>(30, 30);
  static const west_west = const Tuple2<double, double>(45, 45);
  static const north_east = const Tuple2<double, double>(0, 15);
  static const north_west = const Tuple2<double, double>(0, 45);
  static const south_west = const Tuple2<double, double>(30, 45);
  static const south_east = const Tuple2<double, double>(30, 15);
  static const north_south = const Tuple2<double, double>(0, 30);
  static const east_west = const Tuple2<double, double>(15, 45);

  static const reset = const Tuple2<double, double>(0, 0);
  static const idle = const Tuple2<double, double>(37.5, 37.5);
}
