import 'package:flutter/material.dart';

import '../helpers/feed.dart';

class FeedCard extends StatelessWidget {
  Feed feed;

  FeedCard({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  feed.adImage,
                  fit: BoxFit.cover,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${feed.hospitalName} ',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                      ),
                      TextSpan(text: feed.adText,style:TextStyle(fontSize: 14), ),

                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: feed.hashTags.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => Text(feed.hashTags[index],style: TextStyle(fontSize: 14),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
