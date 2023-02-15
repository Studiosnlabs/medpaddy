import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Appointments.dart';
import 'package:medpaddy/screens/AppointmentDoctors_Screen.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:medpaddy/widgets/usersAppointmentCard.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  static const routeName = '/appointments';

  @override
  Widget build(BuildContext context) {
    final String? hospitalName =
        ModalRoute.of(context)!.settings.arguments as String?;
    final appointments =
        Provider.of<Appointments>(context, listen: true).getAppointments;
    print(appointments);

    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: appointments == null
          ? Center(
              child: Text('There are no appointments yet'),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Your appointments at-'),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(hospitalName != null
                          ? hospitalName
                          : appointments[0].hospital!),
                      color: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
                Consumer<Appointments>(builder: (ctx, appointmentData, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return UsersAppointmentCard(
                          doctorName:
                              appointmentData.getAppointments[index].doctorName,
                          speciality:
                              appointmentData.getAppointments[index].specialty,
                          gender: appointmentData.getAppointments[index].gender,
                          timeRange:
                              appointmentData.getAppointments[index].timePeriod,
                          date: appointmentData.getAppointments[index].date,
                        );
                      },
                      itemCount: appointmentData.getAppointments.length,
                    ),
                  );
                }),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.of(context)
              .pushNamed(AppointmentDoctors.routeName, arguments: hospitalName);
        },
        child: Ink(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff55C97C).withOpacity(0.5),
                Color(0xff7AEADA).withOpacity(0.9),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('pushed');
              Navigator.of(context)
                  .pushNamed(AppointmentDoctors.routeName, arguments: hospitalName);
            },
          ),
        ),
      ),
    );
  }
}
