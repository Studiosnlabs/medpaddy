import 'package:flutter/material.dart';
import 'package:medpaddy/screens/OTP_Screen.dart';

import '../widgets/auth_fields.dart';

class SignUp extends StatefulWidget {
  static const routeName='/SignUp';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image.asset("assets/images/logo.png"),
              // const Text(
              //   "Welcome",
              //   style: TextStyle(fontSize: 26, color: Color(0xff36415D)),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff36415D),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: <Widget>[
                  Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Auth_fields(
                              title: "Full Name",
                              inputType: TextInputType.text,
                            ),
                          ),
                          Auth_fields(
                            title: "Phone Number",
                            inputType: TextInputType.number,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Auth_fields(
                              title: "Pin",
                              inputType: TextInputType.visiblePassword,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,bottom: 50),
                            child: Auth_fields(
                              title: "Confirm Pin",
                              inputType: TextInputType.visiblePassword,
                            ),
                          ),
                          MaterialButton(

                            padding: const EdgeInsets.fromLTRB(140.5, 15, 140.5, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side:  BorderSide(
                                  color: Theme.of(context).colorScheme.tertiary,
                                )),
                            onPressed: () {
                              Navigator.of(context).pushNamed(OTPScreen.routeName);
                            },
                            color: Theme.of(context).colorScheme.tertiary,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                            child: Text('OR',style: TextStyle(color:Color(0xff36415D) ),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: new Text('Alredy have an account?',
                                    style: new TextStyle(color: Color(0xFF2E3233))),
                                onTap: () {

                                },
                              ),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: new Text(
                                    'Sign in',
                                    style: new TextStyle(
                                        color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold),
                                  ))
                            ],)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
