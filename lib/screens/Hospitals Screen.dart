import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Hospitals.dart';
import 'package:medpaddy/screens/Hospitals_Options_Screen.dart';
import 'package:medpaddy/widgets/app_drawer.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';

import '../widgets/bottomNavBar.dart';

class HospitalScreen extends StatefulWidget {
  static const routeName = '/hospitalScreen';

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  var hosList = Hospitals().getHospitals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedPaddyAppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: bottomNavBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Select a hospital to get started",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ),
          Container(width: 398,height: 156,child: Image.asset('assets/images/adbanner.jpg'),padding: EdgeInsets.all(8.0)),
          Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(HospitalOptionsScreen.routeName,arguments: hosList[index].name);
                    },
                    child: Container(
                      width: 300,
                      height: 120,
                      child: Card(
                        elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(

                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                    radius: 40.0,
                                    child: Image.asset(
                                      hosList[index].logo,
                                      fit: BoxFit.cover,
                                    )),
                                VerticalDivider(color: Colors.grey),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      hosList[index].name,
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Location: ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(hosList[index].location)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Working Hours: ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(hosList[index].workingHours)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Gps: ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(hosList[index].gps)
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
                itemCount: hosList.length,),
          ),
        ],
      ),
    );
  }
}
