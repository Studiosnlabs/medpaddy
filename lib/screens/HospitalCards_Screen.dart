import 'package:flutter/material.dart';
import 'package:medpaddy/providers/HospitalCardProvider.dart';
import 'package:medpaddy/screens/Create__HospitalCard.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:provider/provider.dart';

import '../widgets/hospital_CardWidget.dart';

class HospitalCardsScreen extends StatelessWidget {
  static const routeName = 'HospitalCards-Screen';

  @override
  Widget build(BuildContext context) {
    final String? hospitalName = ModalRoute.of(context)!.settings.arguments as String?;
    final cards = Provider.of<HospitalCardProvider>(context, listen: true)
        .getHospitalCards;

    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Hospital Card',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
    Expanded(
      child: ListView.builder(itemCount: cards.length,
      itemBuilder: (context, index) =>
      hospitalCardWidget(cards[index])),
    )
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(CreateHospitalCard.routeName, arguments: hospitalName);
        },
        child: Ink(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff55C97C).withOpacity(0.5),
                Color(0xff7AEADA).withOpacity(0.9),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
