import 'package:flutter/material.dart';

class HospitalCard{

  final String? hospitalName;
  final String? patientName;
  final String cardNumber;
  final DateTime? date;
  final String? phone;

  const HospitalCard(
      {required this.hospitalName,
        required this.patientName,
        required this.cardNumber,
        required this.date,
        required this.phone});


}