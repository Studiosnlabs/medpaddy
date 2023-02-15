import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}

class TimeQuantityForm extends StatefulWidget {
  String? form;

  TimeQuantityForm({Key? key, this.form}) : super(key: key);
  String? time;
  DateTime? dateTime;
  String? quantity;

  @override
  State<TimeQuantityForm> createState() => _TimeQuantityFormState();
}

class _TimeQuantityFormState extends State<TimeQuantityForm> {
  String? timePicked;
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    quantityController.addListener(() {
      widget.quantity = quantityController.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              DatePicker.showTime12hPicker(context, showTitleActions: true,
                  onChanged: (date) {
                print('change $date in time zone ' +
                    date.timeZoneOffset.inHours.toString());
              }, onConfirm: (date) {
                widget.time = DateFormat.jm().format(date);
                setState(() {
                  timePicked = widget.time;
                  widget.dateTime = date;
                });
                print('confirm ${widget.time}');
              }, currentTime: DateTime.now());
            },
            child: timePicked == null
                ? Icon(Icons.access_time,color: Color(0xff31AAB7),)
                : Text(
                    timePicked!,
                    style: TextStyle(color: Color(0xff31AAB7)),
                  )),
        Container(
          padding: EdgeInsets.only(right: 0),
          width: 120,
          child: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 5),
                  child: Text(
                    "${widget.form}s",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                filled: true,
                fillColor: Color(0xff31AAB7),
                hintText: '0',
                hintStyle: TextStyle(color: Colors.blueGrey),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff31AAB7))),
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          ),
        ),
      ],
    );
  }
}
