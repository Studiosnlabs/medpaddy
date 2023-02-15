import 'package:flutter/material.dart';
import 'package:medpaddy/screens/SelfExamScreen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  static const routeName = '/OtpScreen';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 40),
            child: Text(
              'Verify your mobile',
              style: TextStyle(fontSize: 35, color: Color(0xff36415D)),
            ),
          ),
          Text(' We sent you a one time password via SMS'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OTPTextField(
              controller: otpController,
              length: 4,
              width: double.infinity,
              fieldWidth: 80,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
                Navigator.of(context).pushReplacementNamed(SelfExamScreen.routeName);
              },
              onChanged: (pin){
                print("Changed: " + pin);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Send again',
                  style: TextStyle(color: Color(0xff9FADB7)),
                )),
          ),
        ],
      ),
    );
  }
}
