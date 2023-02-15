import 'package:flutter/material.dart';

class DosageListItem extends StatefulWidget {
  String? time;
  String? quantity;
  String? form;
  Function? removeDosage;
  bool? isPopup;

  DosageListItem({this.time, this.quantity, this.form, this.removeDosage,this.isPopup});

  @override
  State<DosageListItem> createState() => _DosageListItemState();
}

class _DosageListItemState extends State<DosageListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(
                Icons.remove_circle,
                color: Colors.redAccent,
              ),
              onTap: () {
                widget.removeDosage!();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.time!,
                style: TextStyle(
                    backgroundColor: Color(0xff31AAB7), color: Colors.white),
              ),
            ),
          ],
        ),
        Text("${widget.quantity!} ${widget.form}")
      ],
    );
  }
}
