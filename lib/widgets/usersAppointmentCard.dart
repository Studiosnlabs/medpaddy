import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UsersAppointmentCard extends StatefulWidget {
  final String? doctorName;
  final String? speciality;
  final String? gender;
  final String? timeRange;
  final DateTime? date;

  UsersAppointmentCard(
      {this.doctorName,
      this.speciality,
      this.gender,
      this.timeRange,
      this.date});

  @override
  State<UsersAppointmentCard> createState() => _UsersAppointmentCardState();
}

class _UsersAppointmentCardState extends State<UsersAppointmentCard> {
  Color? _bgColor;

  @override
  void initState() {
    const availableColors = [
      Color(0xff31AAB7),
      Color(0xff97CFD2),
      Color(0xff55C97C),
      Color(0xff202E62),
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.date),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.cancel,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to cancel this Appointment?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('No',style: TextStyle(color:Theme.of(context).colorScheme.secondary),)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Yes',style: TextStyle(color:Theme.of(context).colorScheme.tertiary))),
                  ],
                ));
      },
      onDismissed: (direction) {
        // Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.doctorName!,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      widget.speciality!,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(DateFormat('y-M-d').format(widget.date!),
                        style: (TextStyle(fontSize: 16, color: Colors.white))),
                    Text(
                      widget.timeRange!,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
