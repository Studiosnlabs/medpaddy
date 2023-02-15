import 'package:flutter/material.dart';
import 'package:medpaddy/providers/Feeds.dart';
import 'package:medpaddy/screens/Hospitals%20Screen.dart';
import 'package:medpaddy/widgets/app_drawer.dart';
import 'package:medpaddy/widgets/bottomNavBar.dart';
import 'package:medpaddy/widgets/feedCard.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'homeScreen';
  var feedList = Feeds().getHomeFeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: MedPaddyAppBar(),
      bottomNavigationBar: bottomNavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 255,
              height: 48,
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                      color: Color(0xff55C97C),
                    )),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Connect to a Hospital',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(HospitalScreen.routeName,
                      arguments: 'connect');
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: feedList.length,
                itemBuilder: (ctx, index) => FeedCard(feed: feedList[index])),
          )
        ],
      ),
    );
  }
}
