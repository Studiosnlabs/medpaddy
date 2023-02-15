import 'package:flutter/material.dart';
import 'package:medpaddy/helpers/custom_icons_icons.dart';
import 'package:medpaddy/screens/Appointments_Screen.dart';
import 'package:medpaddy/screens/FirstAidScreen.dart';
import 'package:medpaddy/screens/HomeScreen.dart';
import 'package:medpaddy/screens/Hospitals%20Screen.dart';

class bottomNavBar extends StatefulWidget {
  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 60),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Color(0xff55C97C),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Color(0xff55C97C),
              ),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.firstaid,
                color: Color(0xff55C97C),
              ),
              label: 'First Aid',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.monitor_heart_outlined,
                color: Color(0xff55C97C),
              ),
              label: 'Clinicals',
            ),
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
          onTap: (val) {
            switch (val) {
              case 0:
                {
                  if(ModalRoute.of(context)?.settings.name ==HomeScreen.routeName ){
                    return;

                  }
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
                break;
              case 1:
                {
                  Navigator.of(context).pushNamed(AppointmentScreen.routeName,
                      arguments: 'appointment');
                }
                break;
              case 2:{
                if(ModalRoute.of(context)?.settings.name ==FirstAidScreen.routeName ){
                  return;

                }
                Navigator.of(context).pushReplacementNamed(FirstAidScreen.routeName);
              }
            }
          },
        ),
      ),
    );
  }
}
