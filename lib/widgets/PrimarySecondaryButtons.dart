import 'package:flutter/material.dart';

class PrimarySecondaryButton extends StatefulWidget {
   String? primaryText;
   String? secondaryText;
   String? primaryRoute;
   String? secondaryRoute;
   Function? primaryAction;

  PrimarySecondaryButton(
      {this.primaryText,
      this.secondaryText,
      this.primaryRoute,
      this.secondaryRoute,
      this.primaryAction});

  @override
  State<PrimarySecondaryButton> createState() => _PrimarySecondaryButtonState();
}

class _PrimarySecondaryButtonState extends State<PrimarySecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          padding: const EdgeInsets.fromLTRB(137.5, 15, 137.5, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(
                color: Color(0xff55C97C),
              )),
          onPressed: () {
            // TODO: add function to be passed here to be run by external widget
            widget.primaryAction!();
          },
          color: const Color(0xff55C97C),
          child: Text(
            widget.primaryText!,
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            widget.secondaryText!,
            style: TextStyle(color: Color(0xff0D0428)),
          ),
        ),
      ],
    );
  }
}
