import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medpaddy/screens/Hospitals%20Screen.dart';
import 'package:medpaddy/widgets/emojiInputs.dart';

class SelfExamScreen extends StatefulWidget {
  @override
  State<SelfExamScreen> createState() => _SelfExamScreenState();
}

class _SelfExamScreenState extends State<SelfExamScreen> {
  final String assetName = 'assets/images/dremoji.svg';
  final Widget drSvg = SvgPicture.asset('assets/images/dremoji.svg',
      semanticsLabel: 'Doctor Icon');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: const Text(
                'Emergency',
                textAlign: TextAlign.right,
                style:
                    TextStyle(color: Color(0xff0D0428), fontFamily: 'Poppins'),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0, 0),
            child: Row(
              children: const <Widget>[
                Text(
                  'Hello',
                  style: TextStyle(color: Color(0xff55C97C), fontSize: 20),
                ),
                SizedBox(),
                Text(
                  'Paddy,',
                  style: TextStyle(color: Color(0xff0D0428), fontSize: 20),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              child: const Text('DevNest',
                  style: TextStyle(color: Color(0xff0D0428), fontSize: 25
                      ,fontWeight:FontWeight.w700))),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                drSvg,
                const Text('How are you feeling ?'),
              ],
            ),
          ),
          Container(
            width: 315,
            height: 60,
            child: Card(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Tell us how you are feeling today?',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
            ),
          ),
           Column(
              children: [
                EmojiInputs(),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(137.5, 15, 137.5, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color(0xff55C97C),
                      )),
                  onPressed: () {
                    Navigator.of(context).pushNamed(HospitalScreen.routeName);
                  },
                  color: const Color(0xff55C97C),
                  child: const Text('Submit',style: TextStyle(color: Colors.white),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HospitalScreen.routeName);
                  },
                  child:const Text(
                    'Skip',
                    style: TextStyle(color: Color(0xff0D0428)),
                  ),
                ),
              ],
            ),
        ],
      ),
    ));
  }
}
