import 'package:flutter/cupertino.dart';
import 'package:medpaddy/helpers/feed.dart';

class Feeds with ChangeNotifier {
  List<Feed> _homeFeed = [
    Feed(
        adImage: 'assets/images/adA.png',
        hospitalName: "Airport Women's Hospital",
        adText:
            "presents free breast cancer screening fromthe 1st of October to the 31st of October 2022",
        hashTags: [
          '#BREAST CANCER AWARENESS',
          '#PINKOCTOBER',
          '#AIRPORT WOMENS HOSPITAL'
        ]),
    Feed(
        adImage: 'assets/images/adB.png',
        hospitalName: "Inkoom Hospital",
        adText:
            "presents free cardio screening from the 1st of February to the 28th of February 2022",
        hashTags: ['#FREE CARDIO SCREENING', '#FEBRUARY', '#INKOOM HOSPITAL']),
  ];

  List<Feed> get getHomeFeed {
    return [..._homeFeed];
  }
}
