import 'package:flutter/material.dart';
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
    const Color primaryGreen = Colors.white;
    const Color secondaryDarkBlue = Color(0xff0D0428);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedPaddy',
      theme: theme,
      home: SelfExamScreen(),
      routes: {
        HospitalScreen.routeName: (ctx) => HospitalScreen(),
        HospitalOptionsScreen.routeName: (ctx) => HospitalOptionsScreen(),
      },
    );
  }
}
