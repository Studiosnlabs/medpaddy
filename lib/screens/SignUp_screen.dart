import 'package:flutter/material.dart';
import 'package:medpaddy/screens/OTP_Screen.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/auth_fields.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/SignUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Auth_fields fullNameField = Auth_fields(
    title: "Full Name",
    inputType: TextInputType.text,
  );

  Auth_fields phoneNumberField = Auth_fields(
    title: "Phone Number",
    inputType: TextInputType.number,
  );

  Auth_fields password_field = Auth_fields(
    title: "Pin",
    inputType: TextInputType.visiblePassword,
    ctx: 'signup',
  );

  Auth_fields confirmPassword_field = Auth_fields(
    title: "Confirm Pin",
    inputType: TextInputType.visiblePassword,
  );

  final Widget medPaddyTxtSvg = SvgPicture.asset(
      'assets/images/medpaddytxt.svg',
      semanticsLabel: 'MedPaddy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: medPaddyTxtSvg,
      ),
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
                      fontSize: 26,
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: fullNameField,
                        ),
                        phoneNumberField,
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: password_field,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                          child: confirmPassword_field,
                        ),
                        MaterialButton(
                          minWidth: 300,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                          onPressed: () {
                            if(fullNameField.textEntered!.isEmpty){

                              final snackBar = SnackBar(
                                content:
                                Text('Please enter a your full name'),
                                backgroundColor: Theme.of(context).errorColor,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;

                            }

                            if (phoneNumberField.textEntered!.length !=10 ||
                                !phoneNumberField.textEntered!.startsWith('0')) {
                              final snackBar = SnackBar(
                                content:
                                    Text('Please enter a valid phone number'),
                                backgroundColor: Theme.of(context).errorColor,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (password_field.textEntered!.isEmpty) {
                              final snackBar = SnackBar(
                                content: Text('Please enter a valid pin'),
                                backgroundColor: Theme.of(context).errorColor,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }


                            if (password_field.textEntered !=
                                confirmPassword_field.textEntered) {
                              final snackBar = SnackBar(
                                content: Text('Your pins do not match'),
                                backgroundColor: Theme.of(context).errorColor,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            Navigator.of(context)
                                .pushNamed(OTPScreen.routeName);
                          },
                          color: Theme.of(context).colorScheme.tertiary,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Color(0xff36415D)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: new Text('Already have an account?',
                                  style:
                                      new TextStyle(color: Color(0xFF2E3233))),
                              onTap: () {},
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text(
                                  'Sign in',
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
