import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medpaddy/models/doctor.dart';
import 'package:medpaddy/providers/Doctors.dart';
import 'package:medpaddy/screens/BookAppointment_Screen.dart';
import 'package:medpaddy/widgets/doctorsappointment_card.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';

class AppointmentDoctors extends StatefulWidget {
  static const routeName = '/AppointmentDoctorScreen';

  @override
  State<AppointmentDoctors> createState() => _AppointmentDoctorsState();
}

class _AppointmentDoctorsState extends State<AppointmentDoctors> {
  var docList = Doctors().getDoctors;
  Color? _bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Book an appointment",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BookAppointmentScreen.routeName,
                      arguments: docList[index].name,
                    );
                  },
                  child: DoctorApopointmentCard(
                      doctorName: docList[index].name,
                      speciality: docList[index].specialty,
                      gender: docList[index].gender),
                );
              },
              itemCount: docList.length,
            ),
          ),
        ],
      ),
    );
  }
}
