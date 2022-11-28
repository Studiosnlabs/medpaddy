import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medpaddy/widgets/emojiItem.dart';

class EmojiInputs extends StatelessWidget {

  // final Widget exhaustedSvg = SvgPicture.asset('assets/images/exhustedemoji.svg',
  //     color: Colors.amber,
  //     semanticsLabel: 'Exhausted emoji');
  //
  // final Widget tiredSvg = SvgPicture.asset('assets/images/tiredemoji.svg',
  //     semanticsLabel: 'Tired emoji');
  //
  // final Widget sickSvg = SvgPicture.asset('assets/images/sickemoji.svg',
  //     semanticsLabel: 'Sick emoji');
  //
  // final Widget dizzySvg = SvgPicture.asset('assets/images/dizzy.svg',
  //     semanticsLabel: 'Dizzy emoji');

  final String fitImg='assets/images/exhaustedemojip.png';
  final String tiredImg='assets/images/tiredp.png';
  final String sickImg='assets/images/sickemojip.png';
  final String dizzyImg='assets/images/dizzyemojip.png';




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 368,
      child: GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          EmojiItem(tiredImg,"Tired",0xff63D59F),
          EmojiItem(fitImg, "Fit",0xff78E8D5),
          EmojiItem(sickImg, "Sick",0xff56CA7F),
          EmojiItem(dizzyImg, "Dizzy",0xff2FCCAD),

        ],
      ),
    );

  }
}
