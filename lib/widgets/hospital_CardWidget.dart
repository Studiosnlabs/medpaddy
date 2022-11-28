import 'package:flutter/material.dart';
import 'package:medpaddy/models/HospitalCard.dart';
import 'package:intl/intl.dart';

class hospitalCardWidget extends StatelessWidget {
  final HospitalCard UserHospitalCard;

  hospitalCardWidget(this.UserHospitalCard);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 340,
        height: 150,
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
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          UserHospitalCard.hospitalName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Name: ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(UserHospitalCard.patientName,style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Card No:",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(UserHospitalCard.cardNumber,style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Date of birth: ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(DateFormat('y-M-d').format(UserHospitalCard.date),style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Phone: ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(UserHospitalCard.phone,style: TextStyle(color: Colors.black),),

                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 20,left: 80),
                      child: Image.asset('assets/images/qr-code.png')),
                )

                
              ],
            )
          ],
        ),
      ),
    );
  }
}
