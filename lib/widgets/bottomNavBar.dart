import 'package:flutter/material.dart';
import 'package:medpaddy/helpers/custom_icons_icons.dart';

class bottomNavBar extends StatefulWidget {
  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomRight:Radius.circular(30),bottomLeft: Radius.circular(30) ),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 60),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Color(0xff55C97C),), label:'Hospitals',),
          BottomNavigationBarItem(icon: Icon(CustomIcons.firstaid,color: Color(0xff55C97C),), label:'First Aid',),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined,color: Color(0xff55C97C),), label:'Monitor',),
          BottomNavigationBarItem(icon: Icon(CustomIcons.prescription,color: Color(0xff55C97C),), label:'Prescriptions',),
        ],
          backgroundColor: Colors.white,
          elevation: 20,
          // selectedIconTheme: Theme.of(context).iconTheme,
          selectedLabelStyle: TextStyle(color: Color(0xff0D0428)),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xff0D0428),
          unselectedItemColor: Color(0xff0D0428),
          currentIndex: 0,
          type: BottomNavigationBarType.shifting,
          onTap: (val){},


        ),
      ),
    );
  }
}
