import 'package:flutter/material.dart';
import 'package:medpaddy/models/Prescription.dart';
import 'package:medpaddy/providers/PrescriptionsProvider.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:medpaddy/widgets/prescription_card.dart';
import 'package:provider/provider.dart';

import 'AddMedicationForm.dart';

class PrescriptionRemindersScreen extends StatelessWidget {
  static const routeName='/PrescriptionRemindersScreen';

  const PrescriptionRemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prescriptions =
        Provider.of<PrescriptionsProvider>(context, listen: true).getPrescriptions;
    print(prescriptions);

    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: prescriptions.isEmpty
          ? Center(
            child: Container(
              padding: EdgeInsets.only(top: 100),
        width: 300,
              child: Column(
                children: [
                  Text('There are no medications yet',style: TextStyle(color: Colors.grey),),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                            color: Color(0xff31AAB7),
                          )),
                    color: Color(0xff31AAB7),
                      onPressed: () {
                        ModalRoute.of(context)?.navigator?.pushNamed(AddMedicationForm.routeName);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.white,),
                          Text('Add medication',style: TextStyle(color: Colors.white),)
                        ],
                      ))
                ],
              ),
            ),
          )
          : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Here are your prescriptions'),
                ),
                Consumer<PrescriptionsProvider>(
                  builder: (ctx,prescriptionData,child) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () {
                                // Navigator.of(context).pushNamed(
                                //   prescriptions.routeName,
                                //   arguments: docList[index].name,
                                // );
                              },
                              child: PrescriptionCard(userPrescription: prescriptionData.getPrescriptions[index],)
                            );
                          },
                          itemCount: prescriptions.length,
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  width: 200,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                            color: Color(0xff31AAB7),
                          )),
                      color: Color(0xff31AAB7),
                      onPressed: () {
                        ModalRoute.of(context)?.navigator?.pushNamed(AddMedicationForm.routeName);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.white,),
                          Text('Add medication',style: TextStyle(color: Colors.white),)
                        ],
                      )),
                )
              ],
            ),
    );
  }
}
