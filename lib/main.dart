import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Appointments.dart';
import 'package:medpaddy/providers/HospitalCardProvider.dart';
import 'package:provider/provider.dart';
import 'package:medpaddy/screens/AppointmentDoctors_Screen.dart';
import 'package:medpaddy/screens/Appointments_Screen.dart';
import 'package:medpaddy/screens/BookAppointment_Screen.dart';
import 'package:medpaddy/screens/Create__HospitalCard.dart';
import 'package:medpaddy/screens/HospitalCards_Screen.dart';
import 'package:medpaddy/screens/Hospitals%20Screen.dart';
import 'package:medpaddy/screens/Hospitals_Options_Screen.dart';
import 'package:medpaddy/screens/SelfExamScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = ThemeData(
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: Color(0xff55C97C),
          tertiary: Color(0xff0D0428),
          onPrimary: Colors.black,
          onSecondary: Color(0xff0D0428),
          error: Colors.red,
          surface: Colors.white,
          onSurface: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          onError: Colors.white),
    );

    return MultiProvider(


      providers: [
        
        ChangeNotifierProvider(create: (ctx)=>Appointments()),
        ChangeNotifierProvider(create: (ctx)=>HospitalCardProvider()),
        
      ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedPaddy',
        theme: theme,
        home: SelfExamScreen(),
        routes: {
          HospitalScreen.routeName: (ctx) => HospitalScreen(),
          HospitalOptionsScreen.routeName: (ctx) => HospitalOptionsScreen(),
          HospitalCardsScreen.routeName:(ctx)=>HospitalCardsScreen(),
          CreateHospitalCard.routeName:(ctx)=>CreateHospitalCard(),
          AppointmentDoctors.routeName:(ctx)=>AppointmentDoctors(),
          AppointmentScreen.routeName:(ctx)=>AppointmentScreen(),
          BookAppointmentScreen.routeName:(ctx)=>BookAppointmentScreen(),
        },
      ) ,);




  }
}
