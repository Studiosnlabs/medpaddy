import 'package:flutter/material.dart';
import 'package:medpaddy/screens/Appointments_Screen.dart';
import 'package:medpaddy/screens/HospitalCards_Screen.dart';
import 'package:medpaddy/widgets/bottomNavBar.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:flutter_svg/svg.dart';

class HospitalOptionsScreen extends StatelessWidget {
  static const routeName = '/hospital-Options';

  @override
  Widget build(BuildContext context) {
    final String hospitalName = ModalRoute.of(context).settings.arguments;
    final Widget appointmentIcon = SvgPicture.asset(
        'assets/images/appointmentIcon.svg',
        semanticsLabel: 'Appointment Icon');
    final Widget cardIcon = SvgPicture.asset('assets/images/cardIcon.svg',
        semanticsLabel: 'Card Icon');
    final Widget bellICon = SvgPicture.asset('assets/images/bellIcon.svg',
        semanticsLabel: 'Bell Icon');
    final Widget contactIcon = SvgPicture.asset('assets/images/contactIcon.svg',
        color: Colors.black,
        semanticsLabel: 'Appointment Icon');

    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Welcome to ${hospitalName} '),
            ),
            //Right Card
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(AppointmentScreen.routeName,arguments: hospitalName);
              },
              child: Container(
                  padding: EdgeInsets.only(right: 15),
                  width: 340,
                  height: 140,
                  margin: EdgeInsets.only(left: 80),
                  child: Card(
                    elevation: 5,
                    color: Color(0xff55C97C),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Appointment',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Create Appointments',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text('Manage Appointments',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0, top: 25),
                          child: appointmentIcon,
                        ),
                      ],
                    ),
                  )),
            ),

            //Hospital Card

            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(HospitalCardsScreen.routeName,arguments: hospitalName);
              },
              child: Container(
                  padding: EdgeInsets.only(right: 15),
                  width: 340,
                  height: 140,
                  margin: EdgeInsets.only(right: 80),
                  child: Card(
                    elevation: 5,
                    color: Color(0xff9DCDE2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 25, right: 15),
                          child: cardIcon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Hospital Card',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Create a Card',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text('Manage your Cards',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
//notifications

            InkWell(
              onTap: (){


              },
              child: Container(
                  padding: EdgeInsets.only(right: 15),
                  width: 340,
                  height: 140,
                  margin:EdgeInsets.only(left: 80) ,
                  child: Card(
                    elevation: 5,
                    color: Color(0xff153B50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                              Text('Access all',style: TextStyle(color: Colors.white),),
                              Text('Notifications here',style: TextStyle(color: Colors.white))
                            ],),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 75.0,top: 25),
                          child: bellICon,
                        ),

                      ],
                    ),
                  )),
            ),

//contact us
            InkWell(
              onTap: (){},
              child: Container(
                  padding: EdgeInsets.only(right: 15),
                  width: 340,
                  height: 140,
                  margin: EdgeInsets.only(right: 80),
                  child: Card(
                    elevation: 5,
                    color: Color(0xffFFFFFF),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 25, right: 15),
                          child: contactIcon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Contact us',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Speak to our',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text('Help desk',
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),


          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
