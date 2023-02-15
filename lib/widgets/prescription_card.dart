import 'package:flutter/material.dart';
import 'package:medpaddy/models/Prescription.dart';
import 'package:intl/intl.dart';


class PrescriptionCard extends StatefulWidget {

  Prescription userPrescription;


  PrescriptionCard({required this.userPrescription});

  @override
  State<PrescriptionCard> createState() => _PrescriptionCardState();
}

class _PrescriptionCardState extends State<PrescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      padding: EdgeInsets.all(3),
      child: Card(
          color: Color(0xff31AAB7),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 40.0,
                        child: Image.asset(
                          'assets/images/pillicon.png',
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.userPrescription.title!,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            '${widget.userPrescription.form},${widget.userPrescription.strength}',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${widget.userPrescription.dosage?.elementAt(0).quantity} at ${DateFormat.jm().format((widget.userPrescription.dosage?.elementAt(0).dateTime)!)} ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff5AE1FF),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 40),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                side: const BorderSide(
                                  color: Color(0xff31AAB7),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Skipped',
                              style: TextStyle(color: Color(0xff5AE1FF)),
                            ),
                            color: Color(0xff31AAB7),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                side: const BorderSide(
                                  color: Color(0xff31AAB7),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Taken',
                              style: TextStyle(color: Color(0xff5AE1FF)),
                            ),
                            color: Color(0xff31AAB7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
