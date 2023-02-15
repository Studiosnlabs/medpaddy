import 'package:flutter/material.dart';
import 'package:medpaddy/widgets/doctorsAppbar.dart';
import 'package:medpaddy/widgets/scheduleCards.dart';
import '../providers/Doctors.dart';

class BookAppointmentScreen extends StatefulWidget {
  static const routeName = '/BookAppointmentScreen';

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final String? docName = ModalRoute.of(context)!.settings.arguments as String?;
    var docList = Doctors().findById(docName);
    var schedules = docList.schedules;
    return Stack(
      children: [
        Scaffold(
          appBar: doctorsAppbar(
            gender: docList.gender,
            name: docList.name,
            speciality: docList.specialty,
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 250),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 5,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return scheduleCard(
                scheduleDate: schedules[index].date,
                timeRange: schedules[index].timeRange,
                gender: docList.gender,
                speciality: docList.specialty,
                doctorName: docList.name,
                hospital: docList.hospital,
              );
            },
            itemCount: docList.schedules.length,
          ),
        ),
      ],
    );
  }
}
