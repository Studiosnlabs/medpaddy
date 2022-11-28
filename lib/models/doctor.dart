import 'package:flutter/material.dart';

import '../helpers/schedule.dart';

class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final String gender;
  final List<Schedule> schedules;

  Doctor(
      {@required this.id,
      @required this.name,
      @required this.specialty,
        @required this.gender,
      @required this.hospital,
      @required this.schedules});
}
