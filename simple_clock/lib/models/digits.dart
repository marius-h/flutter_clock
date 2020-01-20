import 'dart:math';

import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

List<List<Tuple2<double, double>>> buildDigit(int digit, Point origin, List<List<Tuple2<double, double>>> grid) {
  List<List<Tuple2<double, double>>> pixels;

  switch (digit) {
    case -1:
      pixels = [
        [ClockState.reset, ClockState.reset],
        [ClockState.reset, ClockState.reset],
        [ClockState.reset, ClockState.reset],
      ];
      break;
    case 0:
      pixels = [
        [ClockState.south_east, ClockState.south_west],
        [ClockState.north_south, ClockState.north_south],
        [ClockState.north_east, ClockState.north_west],
      ];
      break;
    case 1:
      pixels = [
        [ClockState.idle, ClockState.south_south],
        [ClockState.idle, ClockState.north_south],
        [ClockState.idle, ClockState.north_north],
      ];
      break;
    case 2:
      pixels = [
        [ClockState.east_east, ClockState.south_west],
        [ClockState.south_east, ClockState.north_west],
        [ClockState.north_east, ClockState.west_west],
      ];
      break;
    case 3:
      pixels = [
        [ClockState.east_east, ClockState.south_west],
        [ClockState.east_east, ClockState.north_west],
        [ClockState.east_east, ClockState.north_west],
      ];
      break;
    case 4:
      pixels = [
        [ClockState.south_south, ClockState.south_south],
        [ClockState.north_east, ClockState.north_south],
        [ClockState.idle, ClockState.north_north],
      ];
      break;
    case 5:
      pixels = [
        [ClockState.south_east, ClockState.west_west],
        [ClockState.north_east, ClockState.south_west],
        [ClockState.east_east, ClockState.north_west],
      ];
      break;
    case 6:
      pixels = [
        [ClockState.south_east, ClockState.west_west],
        [ClockState.north_south, ClockState.south_west],
        [ClockState.north_east, ClockState.north_west],
      ];
      break;
    case 7:
      pixels = [
        [ClockState.east_east, ClockState.south_west],
        [ClockState.idle, ClockState.north_south],
        [ClockState.idle, ClockState.north_north],
      ];
      break;
    case 8:
      pixels = [
        [ClockState.south_east, ClockState.south_west],
        [ClockState.north_east, ClockState.south_west],
        [ClockState.north_east, ClockState.north_west],
      ];
      break;
    case 9:
      pixels = [
        [ClockState.south_east, ClockState.south_west],
        [ClockState.north_east, ClockState.north_south],
        [ClockState.east_east, ClockState.north_west],
      ];
      break;
  }

  return _moveToPoint(pixels, origin, grid);
}

List<List<Tuple2<double, double>>> _moveToPoint(
    List<List<Tuple2<double, double>>> pixels, Point origin, List<List<Tuple2<double, double>>> grid) {
  //final movedPixels = List<List<Tuple2<double, double>>>.generate(7, (_) => List(11));
  for (var i = 0; i < pixels.length; ++i) {
    for (var j = 0; j < pixels[i].length; ++j) {
      var o = pixels[i][j];
      grid[origin.y + j][origin.x + i] = o;
    }
  }
  return grid;
}
