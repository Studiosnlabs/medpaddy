import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medpaddy/models/Prescription.dart';
import 'package:medpaddy/screens/PrescriptionReminders_Screen.dart';
import 'package:medpaddy/screens/prescrption_list.dart';
import 'package:medpaddy/widgets/DosgeListItem.dart';
import 'package:medpaddy/widgets/auth_fields.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';
import 'package:medpaddy/widgets/prescription_card.dart';
import 'package:medpaddy/widgets/timeQuantity_form.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:medpaddy/providers/Notificationservice.dart';
import 'package:provider/provider.dart';

import '../providers/PrescriptionsProvider.dart';

class AddMedicationForm extends StatefulWidget {
  static const routeName = '/PrescriptionForm';
  static List<String> units = ['mg', 'mcg', 'g', 'ml', '%'];

  static List<String> commonForms = [
    'Capsule',
    'Tablet',
    'Liquid',
    'Topical',
    'Cream',
    'Device',
    'Drop',
    'Foams',
    'Gels',
    'Inhaler',
    'Injection',
    'Lotion',
    'Ointment',
    'Patch',
    'Spray'
  ];

  static var periods = [
    'Days',
    'Weeks',
    'Months',
    'Years',
  ];

  static var meals = [
    'After Meals',
    'Before Meals',
  ];

  AddMedicationForm({Key? key}) : super(key: key);

  @override
  State<AddMedicationForm> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
  int currentStep = 0;
  String periodValue = 'Days';
  String startDate = 'Start Date';
  String endDate = 'End Date';
  bool everyday = false;
  bool everyOtherDay = false;
  TimeQuantityForm? userTimeQuantityForm;
  List<Dosage>? dosages = [];
  Dosage userDosage = Dosage();
  TextEditingController frequencyController = TextEditingController();
  int frequency = -1;
  String frequencyText='Everyday';
  FocusNode frequencyFocus = FocusNode();


  void showValError(String fieldName) {
    final snackBar = SnackBar(
      content: Text('Please provide input for the $fieldName field'),
      backgroundColor: Theme.of(context).errorColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    tz.initializeTimeZones();

    frequencyController.addListener(() {
      frequency = int.parse(frequencyController.text);
    });
    super.initState();
  }

  void clearText() {
    frequencyController.clear();
  }

  void deleteDosage(List<Dosage>? dosages, int index) {
    setState(() {
      dosages?.removeAt(index);
    });
  }

  Auth_fields medicationName = Auth_fields(
    title: 'Medication Name',
    inputType: TextInputType.text,
    ctx: 'meds',
  );

  Auth_fields strength = Auth_fields(
    title: 'Strength',
    inputType: TextInputType.number,
    ctx: 'meds',
  );

  PrescriptionList Units = PrescriptionList(
    title: 'Choose Unit',
    options: AddMedicationForm.units,
  );

  PrescriptionList CommonForms = PrescriptionList(
    title: 'Forms',
    options: AddMedicationForm.commonForms,
  );

  PrescriptionList Diets = PrescriptionList(
    title: 'Diet',
    options: AddMedicationForm.meals,
  );

  // Prescription userPrescriptions = Prescription();

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Details"),
        content: Column(
          children: [medicationName, strength, Units],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Form"),
        content: CommonForms,
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Schedule"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Remind me'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Color(0xff31AAB7),
                      )),
                  onPressed: () {
                    frequencyFocus.unfocus();
                    clearText();
                    setState(() {
                      everyday = !everyday;
                      everyOtherDay = false;
                      frequency = 0;
                      frequencyText='EveryDay';
                    });
                  },
                  color: const Color(0xff31AAB7),
                  child: Row(
                    children: [
                      Text(
                        'Everyday',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: everyday
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Color(0xff31AAB7),
                      )),
                  onPressed: () {
                    clearText();
                    frequencyFocus.unfocus();
                    setState(() {
                      everyOtherDay = !everyOtherDay;
                      everyday = false;
                      frequency=1;
                      frequencyText='Every Other Day';
                    });
                  },
                  color: const Color(0xff31AAB7),
                  child: Row(
                    children: [
                      Text(
                        'Every Other day',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: everyOtherDay
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  width: 130,
                  child: TextField(
                    controller: frequencyController,
                    focusNode: frequencyFocus,
                    onTap: () {
                      setState(() {
                        everyday = false;
                        everyOtherDay = false;
                        //TODO: ADD A CHECK TO SET TEXT EDITING CONTROLLER TO 0 OR 1 WHEN EVERYDAY AND EVERY OTHER DAY VALUES ARE CLICKED
                      });
                    },

                    onEditingComplete: () {
                      frequencyFocus.unfocus();
                      setState(() {
                        everyday = false;
                        everyOtherDay = false;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        prefixIcon: const Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 5, left: 10),
                          child: Text(
                            'Every',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        fillColor: Color(0xff31AAB7),
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff31AAB7))),
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary)),
                    //TODO:RESET THE TEXT FIELD ON CLICK OF EVERYDAY OR EVERY OTHER DAY
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff31AAB7), //<-- SEE HERE
                  ),
                  child: DropdownButton<String>(
                    // Initial Value
                    value: periodValue,
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Color(0xff31AAB7),

                    // Down Arrow Icon
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),

                    // Array list of items
                    items: AddMedicationForm.periods.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        periodValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Time and Quantity'),
            ),
            if (dosages!.isEmpty)
              Text(
                'no times added yet',
                style: TextStyle(color: Colors.grey),
              )
            else
              Container(
                height: 100,
                padding: EdgeInsets.only(right: 120),
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return DosageListItem(
                      time: DateFormat.jm()
                          .format((dosages?.elementAt(i).dateTime)!),
                      quantity: dosages?.elementAt(i).quantity,
                      form: CommonForms.selectedOption,
                      removeDosage: () => deleteDosage(dosages, i),
                    );
                  },
                  itemCount: dosages?.length,
                  shrinkWrap: true,
                ),
              ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: Color(0xff31AAB7),
                  )),
              onPressed: () {
                setState(() {
                  userTimeQuantityForm = TimeQuantityForm(
                    form: CommonForms.selectedOption,
                  );
                });

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pick a Time'),
                        content: userTimeQuantityForm,
                        actions: [
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          MaterialButton(
                            child: const Text(
                              'Approve',
                              style: TextStyle(color: Color(0xff31AAB7)),
                            ),
                            onPressed: () {
                              setState(() {
                                // userDosage?.dateTime =
                                //     userTimeQuantityForm?.dateTime;
                                // userDosage?.quantity =
                                //     userTimeQuantityForm?.quantity;
                                userDosage = Dosage(
                                    dateTime: userTimeQuantityForm?.dateTime,
                                    quantity: userTimeQuantityForm?.quantity);

                                print(userDosage.quantity);
                              });

                              dosages?.add(userDosage);
                              print(dosages);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              color: const Color(0xff31AAB7),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    'Add a time',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Diets,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Start Date and End Date'),
            ),
            Container(
              width: 200,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color(0xff31AAB7),
                    )),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(), onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      startDate = DateFormat.yMMMd().format(date);
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                color: const Color(0xff31AAB7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      startDate,
                      style: TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color(0xff31AAB7),
                    )),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(), onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      endDate = DateFormat.yMMMd().format(date);
                    });
                  },
                      currentTime: DateTime.now().add(const Duration(days: 1)),
                      locale: LocaleType.en);
                },
                color: const Color(0xff31AAB7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      endDate,
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final prescriptionsProvider = Provider.of<PrescriptionsProvider>(context,listen: true);
    return Scaffold(
      appBar: MedPaddyAppBar(),
      body: Container(
          child: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.light(primary: Color(0xff31AAB7))),
        child: Stepper(
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color(0xff31AAB7),
                      )),
                  color: Color(0xff31AAB7),
                  onPressed: details.onStepCancel,
                  child: const Text(
                    'BACK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color(0xff31AAB7),
                      )),
                  color: Color(0xff31AAB7),
                  onPressed: details.onStepContinue,
                  child: const Text(
                    'NEXT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepCancel: () => currentStep == 0
              ? null
              : setState(() {
                  currentStep -= 1;
                }),
          onStepContinue: () {
            bool isLastStep = (currentStep == getSteps().length - 1);
            if (isLastStep) {
              //Do something with this information

              print(Diets.selectedOption);
              if (frequency == -1) {
                showValError('Frequency');
                return;
              }

              if (dosages!.isEmpty) {
                showValError('Quantity and time');
                return;
              }

              if (Diets.selectedOption!.isEmpty) {
                showValError('Meals');
                return;
              }

              if (startDate == 'Start Date') {
                showValError('Start Date');
                return;
              }
              if (endDate == 'End Date') {
                showValError('End Date');
                return;
              }

              Prescription userPrescriptions = Prescription(
                  id: DateTime.now().toString(),
                  title: medicationName.textEntered,
                  form: CommonForms.selectedOption,
                  diet: Diets.selectedOption,
                  frequency: frequency,
                  strength: '${strength.textEntered}${Units.selectedOption}',
                  dosage: dosages);

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color(0xff31AAB7),
                      content: Container(
                        height: 300,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/pillicon.png'),
                            ),
                            Text(
                              userPrescriptions.title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${userPrescriptions.form},${userPrescriptions.strength}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xff278B96),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 4),
                                    child: Text(
                                      frequencyText ,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  ListView.builder(
                                    itemBuilder: (ctx, i) {
                                      return Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 100.0,left: 5.0),
                                            child: Text(DateFormat.jm().format((dosages?.elementAt(i).dateTime)!),style: TextStyle(color: Colors.white),),
                                          ),
                                          Text((dosages?.elementAt(i).quantity)!,style:TextStyle(color: Colors.white)),
                                          Text(CommonForms.selectedOption!,style:TextStyle(color: Colors.white))
                                        ],
                                      );

                                      //   DosageListItem(
                                      //   time: DateFormat.jm().format(
                                      //       (dosages?.elementAt(i).dateTime)!),
                                      //   quantity: dosages?.elementAt(i).quantity,
                                      //   form: CommonForms.selectedOption,
                                      //   removeDosage: () =>
                                      //       deleteDosage(dosages, i),
                                      // );
                                    },
                                    itemCount: dosages?.length,
                                    shrinkWrap: true,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        MaterialButton(
                          color: Color(0xff278B96),
                          child: const Text(
                            'Approve',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            int id = 0;
                            userPrescriptions.dosage!.forEach((dose) {
                              print(dosages!.length.toString());

                              var dateString =
                                  DateFormat.jm().format(dose.dateTime!);
                              String desc =
                                  "It is $dateString,time to take ${dose.quantity} ${userPrescriptions.form} of ${userPrescriptions.title} ";
                              NotificationService().scheduleDailyNotification(
                                  dose.dateTime!.hour,
                                  dose.dateTime!.minute,
                                  dose.dateTime!,
                                  id++,
                                  userPrescriptions.title!,
                                  desc);
                            });


                            Navigator.of(context).pop();
                            prescriptionsProvider.addPrescription(userPrescriptions);
                            ModalRoute.of(context)?.navigator?.pushNamed(PrescriptionRemindersScreen.routeName);


                          },
                        ),
                      ],
                    );
                  });

              // var dose = userPrescriptions.dosage!.elementAt(0);

              // NotificationService().showNotification(
              //     1,
              //     userPrescriptions.title!,
              //     "It is $dateString,time to take ${dose.quantity} ${userPrescriptions.form} of ${userPrescriptions.title} ");

            } else {
              if (currentStep == 0) {
                if (medicationName.textEntered!.isEmpty) {
                  showValError('Medication Name');
                  return;
                }
                if (strength.textEntered!.isEmpty) {
                  showValError('Strength');
                  return;
                }
                if (Units.selectedOption!.isEmpty) {
                  showValError('Units');
                  return;
                }
              }

              if (currentStep == 1) {
                if (CommonForms.selectedOption == null) {
                  showValError('Forms');
                  return;
                }
              }

              // print(medicationName.textEntered);
              // print(strength.textEntered);
              // print(Units.selectedOption);

              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => setState(() {
            currentStep = step;
          }),
          steps: getSteps(),
        ),
      )),
    );
  }
}
