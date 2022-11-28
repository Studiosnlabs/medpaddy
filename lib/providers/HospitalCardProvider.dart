import 'package:flutter/cupertino.dart';
import 'package:medpaddy/models/HospitalCard.dart';

class HospitalCardProvider with ChangeNotifier {
  List<HospitalCard> _list = [
    HospitalCard(
        cardNumber: '10000',
        date: DateTime(2022),
        hospitalName: "Inkoom Hospital",
        patientName: 'Emmanuel',
        phone: '024892922')
  ];

 List<HospitalCard> get getHospitalCards {
    return [..._list];
  }

  void AddHospitalCard(String hospitalName, String patientName,
      String cardNumber, DateTime date, String phone) {
    final newCard = HospitalCard(
        hospitalName: hospitalName,
        patientName: patientName,
        cardNumber: cardNumber,
        date: date,
        phone: phone);

    _list.add(newCard);

    notifyListeners();
  }
}
