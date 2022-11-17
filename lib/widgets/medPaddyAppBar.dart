import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedPaddyAppBar extends StatelessWidget implements PreferredSizeWidget {


  final Widget medPaddyTxtSvg = SvgPicture.asset('assets/images/medpaddytxt.svg',
      semanticsLabel: 'MedPaddy');

  @override
  Widget build(BuildContext context) {
    return AppBar (
      iconTheme: IconThemeData(color: Color(0xff0D0428)),
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
            color: Colors.white,
          )),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25,right: 10),
          child: Text("Emergency",style: TextStyle(color: Color(0xff0D0428),),),
        )
      ] ,
      bottom: PreferredSize(
    child: Container(
      margin: EdgeInsets.only(right: 200),
    color: Colors.white,
      child: medPaddyTxtSvg
    ),
    preferredSize: Size.fromHeight(kToolbarHeight)
    ),

    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(154);
}
