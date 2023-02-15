import 'package:flutter/material.dart';
import 'package:medpaddy/screens/SignUp_screen.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

import '../widgets/auth_fields.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignIn';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _form = GlobalKey<FormState>();
  String phoneNumber = '';
  String password = '';

  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    textController.addListener(() {
      setState(() {
        phoneNumber = textController.text;
        password = passwordController.text;
        print(password);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Auth_fields phoneNumberField = Auth_fields(
    title: "Phone Number",
    inputType: TextInputType.number,
  );

  Auth_fields password_field = Auth_fields(
    title: "Pin",
    inputType: TextInputType.visiblePassword,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/images/logo.png"),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 26, color: Color(0xff36415D)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff36415D),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        phoneNumberField,
                        Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: password_field),
                        FlutterPasswordStrength(
                          password: password_field.textEntered,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Pin?',
                                style: TextStyle(color: Color(0xff36415D)),
                              )),
                        ),
                        MaterialButton(
                          minWidth: 300,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                          onPressed: () {},
                          color: Theme.of(context).colorScheme.tertiary,
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Color(0xff36415D)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: new Text('Don\'t have an account?',
                                  style: new TextStyle(
                                      color: Color(0xFF2E3233))),
                              onTap: () {},
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(SignUp.routeName);
                                },
                                child: new Text(
                                  'Sign up',
                                  style: new TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
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
