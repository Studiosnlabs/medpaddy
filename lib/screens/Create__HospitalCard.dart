import 'package:flutter/material.dart';
import 'package:medpaddy/helpers/hospitalCardForm.dart';
import 'package:medpaddy/models/HospitalCard.dart';
import 'package:medpaddy/providers/HospitalCardProvider.dart';
import 'package:medpaddy/screens/HospitalCards_Screen.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/PrimarySecondaryButtons.dart';

class CreateHospitalCard extends StatefulWidget {
  static const routeName = 'Create-HospitalCards';

  @override
  State<CreateHospitalCard> createState() => _CreateHospitalCardState();
}

class _CreateHospitalCardState extends State<CreateHospitalCard> {
  final _form = GlobalKey<FormState>();
  var _selectedDate = 'date of birth';
  var _firstName;
  var _lastName;
  HospitalCardForm hospitalCardForm = HospitalCardForm();
  DateTime? _date;

  void _saveForm() {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    final card = HospitalCard(
        hospitalName: hospitalCardForm.hospitalName,
        patientName: hospitalCardForm.patientName,
        cardNumber: DateTime.now().microsecond.toString(),
        date: hospitalCardForm.date,
        phone: hospitalCardForm.phone);

    Provider.of<HospitalCardProvider>(context, listen: false).AddHospitalCard(
        card.hospitalName,
        card.patientName,
        card.cardNumber,
        card.date,
        card.phone);

    Navigator.of(context).pushReplacementNamed(HospitalCardsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final String hospitalName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Create Hospital Card-'),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(hospitalName),
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                      key: _form,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'FIRST NAME',
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary)),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first names';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _firstName = "$value";
                              },
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'LAST NAME',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please provide enter your last name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _lastName = "$value";
                                  hospitalCardForm.patientName =
                                      "$_firstName $_lastName";
                                  hospitalCardForm.hospitalName = hospitalName;
                                }),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'PHONE NUMBER',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      double.tryParse(value) == null ||
                                      double.parse(value) == 0) {
                                    return 'Please provide a valid phone number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  hospitalCardForm.phone = value;
                                }),
                            TextFormField(
                                controller:
                                    TextEditingController(text: _selectedDate),
                                decoration: InputDecoration(
                                    labelText: 'DATE OF BIRTH',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)),
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    setState(() {
                                      _selectedDate =
                                          DateFormat('y-M-d').format(date);
                                      _date = date;
                                    });
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    print('confirm $date');
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please provide a date of birth';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  hospitalCardForm.date = _date;
                                }),
                            Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: PrimarySecondaryButton(
                                primaryText: "Create Card",
                                secondaryText: "Cancel",
                                primaryAction: _saveForm,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
