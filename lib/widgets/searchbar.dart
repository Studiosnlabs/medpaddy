import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 60,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(
              color: Color(0xff55C97C),
            )),
        child: TextFormField(
          cursorColor: Colors.black,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: const InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Invalid email!';
            }
            return null;
          },
          onSaved: (value) {},
        ),
      ),
    );
  }
}
