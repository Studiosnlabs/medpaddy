import 'dart:async';

import 'package:flutter/material.dart';

class CountDownDialogue extends StatefulWidget {
  const CountDownDialogue({Key? key}) : super(key: key);

  @override
  State<CountDownDialogue> createState() => _CountDownDialogueState();
}

class _CountDownDialogueState extends State<CountDownDialogue> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 30);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));




    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color(0xff55C97C),
          )),
      title: Text('Calling an Ambulance in...',style: TextStyle(fontSize: 14,),textAlign: TextAlign.center,),
      content: Text(
        '00:$seconds',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
          fontSize: 50,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          child: const Text('Cancel',style: TextStyle(color:Color(0xff55C97C))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Call Now!',style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff55C97C))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
