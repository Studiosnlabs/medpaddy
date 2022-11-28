

import 'package:flutter/cupertino.dart';

class Schedule {
  final DateTime date;
  final String timeRange;
  final int maxCapacity;
  final int numberOfBookings;
  final bool isAvailable;

  Schedule(
      {
        @required this.date,
     @required this.timeRange,
     @required this.maxCapacity,
      this.numberOfBookings=0,
      this.isAvailable=true}
      );




}