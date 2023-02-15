import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Appointments.dart';
import 'package:medpaddy/providers/HospitalCardProvider.dart';
import 'package:medpaddy/providers/Notificationservice.dart';
import 'package:medpaddy/providers/PrescriptionsProvider.dart';
import 'package:medpaddy/screens/AddMedicationForm.dart';
import 'package:medpaddy/screens/ConnectHospital_Screen.dart';
import 'package:medpaddy/screens/FirstAidScreen.dart';
import 'package:medpaddy/screens/HomeScreen.dart';
import 'package:medpaddy/screens/OTP_Screen.dart';
import 'package:medpaddy/screens/PrescriptionReminders_Screen.dart';
import 'package:medpaddy/screens/SignIn_Screen.dart';
import 'package:medpaddy/screens/SignUp_screen.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
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
        ChangeNotifierProvider(create: (ctx) => Appointments()),
        ChangeNotifierProvider(create: (ctx) => HospitalCardProvider()),
        ChangeNotifierProvider(create: (ctx)=>PrescriptionsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedPaddy',
        theme: theme,
        home: PrescriptionRemindersScreen(),
        routes: {
          FirstAidScreen.routeName: (ctx) => FirstAidScreen(),
          SignUp.routeName: (ctx) => const SignUp(),
          SelfExamScreen.routeName: (ctx) => SelfExamScreen(),
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          OTPScreen.routeName: (ctx) => const OTPScreen(),
          HospitalScreen.routeName: (ctx) => HospitalScreen(),
          HospitalOptionsScreen.routeName: (ctx) => HospitalOptionsScreen(),
          HospitalCardsScreen.routeName: (ctx) => HospitalCardsScreen(),
          CreateHospitalCard.routeName: (ctx) => CreateHospitalCard(),
          AppointmentDoctors.routeName: (ctx) => AppointmentDoctors(),
          AppointmentScreen.routeName: (ctx) => AppointmentScreen(),
          BookAppointmentScreen.routeName: (ctx) => BookAppointmentScreen(),
          ConnectHospital.routeName: (ctx) => const ConnectHospital(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AddMedicationForm.routeName: (ctx) => AddMedicationForm(),
          PrescriptionRemindersScreen.routeName:(ctx)=>PrescriptionRemindersScreen()
        },
      ),
    );
  }
}
