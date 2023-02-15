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

  @override
  void initState() {
    passwordVisible = false;
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
                fontSize: widget.ctx == 'meds' ? 15 : 20,
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
            obscureText: passwordVisible,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onSaved: (value) {},
            onChanged: (v)=>widget.onChanged,
          ),
        )
      ],
    );
  }
}
