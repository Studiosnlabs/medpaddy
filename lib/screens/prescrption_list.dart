import 'package:flutter/material.dart';

class PrescriptionList extends StatefulWidget {
  String? title;
  List<String>? options;
  String? selectedOption;


  PrescriptionList({this.title, this.options,});

  @override
  State<PrescriptionList> createState() => _PrescriptionListState();
}

class _PrescriptionListState extends State<PrescriptionList> {
  bool isChecked = false;

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
                color: Color(0xff36415D)),

          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff31AAB7),
          ),
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.options!.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom: -20,left: 10),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -4),
                      title: Text(
                        widget.options![index],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: _selectedIndex == index ? Icon(Icons.check,color: Colors.white,) : null,
                      onTap: () {
                        setState(() {
                          _selectedIndex=index;
                          widget.selectedOption = widget.options![index];
                        });
                      },
                    ),
                    Divider(color: Colors.white,)
                  ],
                );
              }),
        ),
      ],
    );
  }
}
