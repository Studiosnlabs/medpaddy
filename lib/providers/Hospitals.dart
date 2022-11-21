import 'package:flutter/material.dart';
import 'package:medpaddy/models/Hospital.dart';

class Hospitals {
  List<Hospital> _kordziHospitals = [
    Hospital(
        id: DateTime.now().toString(),
        name: 'AIRPORT WOMENS HOSPITAL',
        location: "16 Kofi Annan St. Accra",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/AWH.png'),
    Hospital(
        id: DateTime.now().toString(),
        name: 'INKOOM HOSPITAL',
        location: "143 Nungua Link",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/inkoom.png'),
    Hospital(
        id: DateTime.now().toString(),
        name: 'NEROCONSULT',
        location: "143 Nungua Link",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/neuro.png'),
    Hospital(
        id: DateTime.now().toString(),
        name: 'Chrispod Diagnostic Centre',
        location: "143 Nungua Link",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/Chrispod.png'),
    Hospital(
        id: DateTime.now().toString(),
        name: 'Elmash Heath Care ',
        location: "143 Nungua Link",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/elmash.png'),
    Hospital(
        id: DateTime.now().toString(),
        name: 'Empat Caiquo Hospital',
        location: "143 Nungua Link",
        gps: "Open 24 hours",
        workingHours: "GA -153- 1844",
        logo: 'assets/images/empat.png'),
  ];


   List<Hospital> get getHospitals{

    return [..._kordziHospitals];
  }



}
