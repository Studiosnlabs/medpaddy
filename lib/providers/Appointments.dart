import 'package:flutter/cupertino.dart';

import '../models/Appointment.dart';

class Appointments with ChangeNotifier {
  List<Appointment> _userAppointments = [
    Appointment(
        doctorName: 'Dr.Kordzi',
        specialty: 'Dentist',
        date: DateTime.now(),
        timePeriod: '4pm-6pm',
        gender: 'assets/images/M.png',
    hospital:"Devnest Hospital"),
  ];

  List<Appointment> get getAppointments {
    return [..._userAppointments];
  }

  void addAppointment(String doctorName, DateTime date, String specialty,
      String timePeriod, String gender) {
    final newAppointment = Appointment(
        doctorName: doctorName,
        specialty: specialty,
        date: date,
        timePeriod: timePeriod,
        gender: gender);

    _userAppointments.add(newAppointment);

    notifyListeners();
  }
}
