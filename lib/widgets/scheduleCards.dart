import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medpaddy/providers/Appointments.dart';
import 'package:medpaddy/screens/Appointments_Screen.dart';

class scheduleCard extends StatefulWidget {
  final DateTime scheduleDate;
  final String timeRange;
  final String doctorName;
  final String speciality;
  final String gender;
  final String hospital;

  scheduleCard(
      {this.scheduleDate,
      this.timeRange,
      this.doctorName,
      this.gender,
      this.speciality,
      this.hospital});

  @override
  State<scheduleCard> createState() => _scheduleCardState();
}

class _scheduleCardState extends State<scheduleCard> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Color(0xff31AAB7),
      Color(0xff97CFD2),
      Color(0xff55C97C),
      Color(0xff202E62),
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<Appointments>(context, listen: true);
    return Container(
        padding: EdgeInsets.all(8.0),
        width: 300,
        height: 170,
        child: Card(
          color: _bgColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateFormat('EEEE').format(widget.scheduleDate),
                  style: (TextStyle(fontSize: 24, color: Colors.white)),
                ),
                Text(
                  DateFormat('y-M-d').format(widget.scheduleDate),
                  style: (TextStyle(fontSize: 16, color: Colors.white)),
                ),
                Text(
                  widget.timeRange,
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(
                          color: Color(0xff55C97C),
                        )),
                    onPressed: () {
                      print("booked");
                      appointments.addAppointment(
                          widget.doctorName,
                          widget.scheduleDate,
                          widget.speciality,
                          widget.timeRange,
                          widget.gender);
                      Navigator.of(context).pushNamed(
                          AppointmentScreen.routeName,
                          arguments: widget.hospital);
                    },
                    child: Text(
                      'Book appointment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
