import 'package:flutter/material.dart';
import 'package:medpaddy/widgets/countDownDialogue.dart';
import 'package:medpaddy/widgets/sickPromptDialogue.dart';

class EmojiItem extends StatefulWidget {
  final String emojiPath;
  final String emojiText;
  final int colorhex;

  get getEmojiText {
    return emojiText;
  }

  EmojiItem(
    this.emojiPath,
    this.emojiText,
    this.colorhex,
  );

  @override
  State<EmojiItem> createState() => _EmojiItemState();
}

class _EmojiItemState extends State<EmojiItem> {
  var isTapped = false;

  CountDownDialogue showCountDialogue() {
    return CountDownDialogue();
  }

  void inputSelected() {
    setState(() {
      isTapped = !isTapped;
      print("tapped!");
    });

    if (widget.emojiText == 'Dizzy') {
      showDialog(context: context, builder: (ctx)=>CountDownDialogue());
    }
    else if(widget.emojiText == 'Sick'){
      showDialog(context: context, builder: (ctx)=>SickPromptDialogue());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isTapped ? Color(0xffB3E5CD) : Color(widget.colorhex),
      child: InkWell(
          onTap: () {
            inputSelected();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: isTapped ? Color(0xffB3E5CD) : Color(widget.colorhex),
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
