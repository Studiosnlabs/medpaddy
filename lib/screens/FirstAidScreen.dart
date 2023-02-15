import 'package:flutter/material.dart';
import 'package:medpaddy/widgets/app_drawer.dart';
import 'package:medpaddy/widgets/bottomNavBar.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import '../providers/Feeds.dart';
import '../widgets/feedCard.dart';
import 'Hospitals Screen.dart';
import '../widgets/searchbar.dart';

class FirstAidScreen extends StatefulWidget {
  static const routeName = 'firstaidScreen';

  @override
  State<FirstAidScreen> createState() => _FirstAidScreenState();
}

class _FirstAidScreenState extends State<FirstAidScreen> {
  var feedList = Feeds().getHomeFeed;
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MedPaddyAppBar(),
        bottomNavigationBar: bottomNavBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 350,
                height: 48,
                child:SearchBar() ,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: feedList.length,
                  itemBuilder: (ctx, index) => FeedCard(feed: feedList[index])),
            )
          ],
        ));
  }
}
