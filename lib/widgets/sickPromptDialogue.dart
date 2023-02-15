import 'package:flutter/material.dart';

class SickPromptDialogue extends StatelessWidget {
  const SickPromptDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color(0xff55C97C),
          )),
      title: Text(
        'What symptoms are you \n experiencing?',
        style: TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
      content: TextFormField(
        cursorColor: Theme.of(context).colorScheme.tertiary,
        decoration: InputDecoration(
            hintText: 'Tell us...',
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Color(0xff55C97C),
              ),
            )

        ),
        keyboardType: TextInputType.multiline,
        maxLines: 5,
      ),
      actions: [
        TextButton(
          child:
              const Text('Cancel', style: TextStyle(color: Color(0xff55C97C))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Send',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff55C97C))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

  }
}
