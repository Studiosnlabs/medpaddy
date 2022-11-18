import 'package:flutter/material.dart';
import 'package:medpaddy/screens/Hospitals%20Screen.dart';
import 'package:medpaddy/screens/SelfExamScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final ThemeData theme =ThemeData( fontFamily:'Poppins');
    const Color primaryGreen=Colors.white;
    const Color secondaryDarkBlue=Color(0xff0D0428);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedPaddy',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary:primaryGreen,secondary:secondaryDarkBlue ),iconTheme: IconThemeData(color: secondaryDarkBlue)),

      home:  SelfExamScreen(),
      routes: {
        HosptialScreen.routeName:(ctx)=>HosptialScreen(),

      },
    );
  }
}


