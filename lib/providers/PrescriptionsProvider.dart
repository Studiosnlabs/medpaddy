import 'package:flutter/cupertino.dart';

import '../models/Prescription.dart';

class PrescriptionsProvider with ChangeNotifier {
  List<Prescription> _userPrescriptions = [];

  List<Prescription> get getPrescriptions {
    return [..._userPrescriptions];
  }

  void addPrescription(Prescription userPrescription) {
    final newPrescription = Prescription(
        id: userPrescription.id,
        title: userPrescription.title,
        form: userPrescription.form,
        strength: userPrescription.strength,
        dosage: userPrescription.dosage,
        frequency: userPrescription.frequency,
        diet: userPrescription.diet);

    _userPrescriptions.add(newPrescription);
    print(_userPrescriptions.elementAt(0).title);

    notifyListeners();
  }
}
