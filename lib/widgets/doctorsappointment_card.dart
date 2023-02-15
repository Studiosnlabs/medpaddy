import 'dart:math';

import 'package:flutter/material.dart';


class DoctorApopointmentCard extends StatefulWidget {

  final String? doctorName;
  final String? speciality;
  final String? gender;


  DoctorApopointmentCard({this.doctorName, this.speciality, this.gender});

  @override
  State<DoctorApopointmentCard> createState() => _DoctorApopointmentCardState();
}

class _DoctorApopointmentCardState extends State<DoctorApopointmentCard> {

  Color? _bgColor;

  @override
  void initState() {
    const availableColors=[
      Color(0xff31AAB7),
      Color(0xff97CFD2),
      Color(0xff55C97C),
      Color(0xff202E62),
    ];

    _bgColor=availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      padding: EdgeInsets.all(15),
      child: Card(
          color: _bgColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      child: Image.asset(
                        widget.gender!,
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.doctorName!,
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                    Row(
                      children: <Widget>[
                        Text(widget.speciality!,style:TextStyle(
                          fontSize: 20,color: Colors.white),
                        ) ,
                      ],
                    ),

                  ],
                )
              ],
            ),
          )),
    );
  }
}
