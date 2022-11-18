import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Hospitals.dart';
import 'package:medpaddy/widgets/app_drawer.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';

import '../widgets/bottomNavBar.dart';

class HosptialScreen extends StatefulWidget {

  static const routeName='/hospitalScreen';

  @override
  State<HosptialScreen> createState() => _HosptialScreenState();
}

class _HosptialScreenState extends State<HosptialScreen> {

  var hosList=Hospitals().getHospitals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedPaddyAppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: bottomNavBar(),
      body: ListView.builder(itemBuilder: (ctx,index){

        return Container(
          width: 300,
          height: 100,
          child: Card(child: Row(children: <Widget>[
          CircleAvatar(
              radius: 30,
              child: Image.asset(hosList[index].logo)),
            Divider(),
            Column(
              children: <Widget> [
                Text(hosList[index].name,style: TextStyle(fontSize:15,fontWeight:FontWeight.w700),),
                Row(children: <Widget>[
                  Text("Location",style: TextStyle(color: Colors.grey),),
                  Text(hosList[index].location)

                ],
                ),

                Row(children: <Widget>[
                  Text("Working Hours",style: TextStyle(color: Colors.grey),),
                  Text(hosList[index].workingHours)

                ],
                ),

                Row(children: <Widget>[
                  Text("Gps",style: TextStyle(color: Colors.grey),),
                  Text(hosList[index].gps)

                ],
                ),



              ],
            )
          ],)),);

      },itemCount:hosList.length ),);
  }
}
