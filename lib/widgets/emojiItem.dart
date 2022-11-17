import 'package:flutter/material.dart';


class EmojiItem extends StatefulWidget {
  final String emojiPath;
  final String emojiText;

  get getEmojiText{
    return emojiText;
  }

  EmojiItem(this.emojiPath, this.emojiText);

  @override
  State<EmojiItem> createState() => _EmojiItemState();
}

class _EmojiItemState extends State<EmojiItem> {

  var isTapped=false;

  void inputSelected(){

    setState(() {
      isTapped=!isTapped;
      print("tapped!");
    });


  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            inputSelected();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Container(
              color: isTapped ? Color(0x8955c97c):Colors.white ,
              child: GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                children: <Widget>[
                    Image.asset(widget.emojiPath),
                    Text(widget.emojiText)
                ],
              ),
                  )),
            ),
          )),
    );
  }
}
