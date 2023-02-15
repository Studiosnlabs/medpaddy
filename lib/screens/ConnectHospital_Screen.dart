import 'package:flutter/material.dart';

class ConnectHospital extends StatefulWidget {
   static const routeName='/connectHospital';

  const ConnectHospital({Key? key}) : super(key: key);

  @override
  State<ConnectHospital> createState() => _ConnectHospitalState();
}

class _ConnectHospitalState extends State<ConnectHospital> {
  @override
  Widget build(BuildContext context) {
    final String? hospitalName =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Enter your $hospitalName hospital card or folder number',style: TextStyle(fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(12),
                child: TextFormField(
                  // autofocus: false,
                  // autocorrect: false,
                  cursorColor: Theme.of(context).colorScheme.tertiary,
                  decoration: InputDecoration(
                    hintText: "Enter your card number here",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid $hospitalName cardNumber';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: 255,
                height: 48,
                child: MaterialButton(

                  color: Theme.of(context).colorScheme.secondary,
                  shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color(0xff55C97C),
                      )),
                  child: Text('Connect',style: TextStyle(color: Colors.white),),

                  onPressed: () {

                  },
                ),
              ),
            ),
            SizedBox(height: 100,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: new Text('Don’t have a card?',
                      style: new TextStyle(color: Color(0xFF2E3233))),
                  onTap: () {},
                ),
                SizedBox(height: 8,),
                GestureDetector(
                    onTap: (){
                      // Navigator.of(context).pushNamed(SignUp.routeName);
                    },
                    child: new Text(
                      'REGISTER WITH US',
                      style: new TextStyle(
                          color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold),
                    ))
              ],)


          ],
        ),
      ),
    );
  }
}
