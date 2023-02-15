import 'package:flutter/material.dart';

class Auth_fields extends StatefulWidget {
  String? title;
  TextInputType? inputType;
  Icon? icon;
  String? ctx;
  String? textEntered;
  ValueChanged<String>? onChanged;

  Auth_fields({Key? key, this.title, this.inputType, this.icon, this.ctx})
      : super(key: key);

  @override
  State<Auth_fields> createState() => _Auth_fieldsState();
}

class _Auth_fieldsState extends State<Auth_fields> {
  late bool passwordVisible;
  TextEditingController textController = TextEditingController();
  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String _displayText = 'Please enter a password';

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Please enter you password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Your password is too short';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password is average';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = 'Your password is strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  }




  @override
  void initState() {
    passwordVisible = true;
    textController.addListener(() {
      setState(() {
        widget.textEntered = textController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
          child: Text(
            widget.title!,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xff36415D)),
          ),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: TextFormField(
            // autofocus: false,
            // autocorrect: false,
            controller: textController,
            style: widget.ctx == 'meds' ? TextStyle(color: Colors.white) : null,
            cursorColor: Theme.of(context).colorScheme.tertiary,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: widget.ctx == 'meds' ? Color(0xff31AAB7) : Colors.white,
                hintText: widget.ctx == 'meds' ? widget.title : null,
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: widget.inputType == TextInputType.visiblePassword
                    ? IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )
                    : null,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: widget.ctx == 'meds'
                        ? BorderSide(color: Color(0xff31AAB7))
                        : BorderSide(color: Colors.white)),
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary)),
            keyboardType: widget.inputType,
            obscureText: widget.inputType == TextInputType.visiblePassword?passwordVisible:false,
            autocorrect:widget.ctx == 'meds' ? true:false,
            enableSuggestions:widget.ctx == 'meds' ? true:false ,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onSaved: (value) {},
            onChanged:widget.ctx=='signup' ?(value) => _checkPassword(value): null,
          ),
        ),
        if(widget.ctx=='signup')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_displayText),
              LinearProgressIndicator(
                value: _strength,
                backgroundColor: Colors.grey[300],
                color: _strength <= 1 / 4
                    ? Colors.red
                    : _strength == 2 / 4
                    ? Colors.yellow
                    : _strength == 3 / 4
                    ? Colors.blue
                    : Colors.green,
                minHeight: 4,
              ),
            ],
          )



      ],
    );
  }
}
