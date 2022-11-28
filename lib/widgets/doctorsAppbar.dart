import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class doctorsAppbar extends StatelessWidget implements PreferredSizeWidget {
// For appointment

  final String gender;
  final String name;
  final String speciality;

  doctorsAppbar({this.gender, this.name, this.speciality});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Color(0xffFFFFFF)),
      bottom: PreferredSize(
          child:Container(
            margin: EdgeInsets.only(left: 20,bottom: 70),
              child: Column(
                children: <Widget>[
                  CircleAvatar(child:Image.asset(gender) ,radius: 30),
                  Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.white),),
                  Text(speciality,style: TextStyle(color: Colors.white),)
                ],
              )),
          preferredSize: Size.fromHeight(kToolbarHeight)
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff55C97C).withOpacity(0.9),
              Color(0xff7AEADA).withOpacity(0.5),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, 1],
          ),
        ),
      ),
      toolbarHeight: 70,
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25, right: 10),
          child: Text(
            "Emergency",
            style: TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(250);
}
