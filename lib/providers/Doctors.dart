import '../helpers/schedule.dart';
import '../models/doctor.dart';

class Doctors {
  List<Doctor> _list = [
    Doctor(
        id: DateTime.now().toString(),
        name: "Dr.Kordzi",
        specialty: "Dentist",
        hospital: "NeuroConsult",
        gender: "assets/images/M.png",
        schedules: [
          Schedule(
            date: DateTime(2022, 11, 25),
            maxCapacity: 10,
            timeRange: "2pm-4pm",
          ),
          Schedule(
            date: DateTime(2022, 11, 28),
            maxCapacity: 10,
            timeRange: "1pm-2pm",
          )
        ]),
    Doctor(
        id: DateTime.now().toString(),
        name: "Dr.Kordzilla",
        specialty: "Cardiologist",
        hospital: "Airpot Womens Hospital",
        gender: "assets/images/F.png",
        schedules: [
          Schedule(
            date: DateTime(2022, 11, 25),
            maxCapacity: 10,
            timeRange: "9am-2pm",
          ),
          Schedule(
            date: DateTime(2022, 12, 25),
            maxCapacity: 10,
            timeRange: "2pm-4pm",
          ),
          Schedule(
            date: DateTime(2022, 12, 15),
            maxCapacity: 10,
            timeRange: "12pm-4pm",
          ),
          Schedule(
            date: DateTime(2022, 12, 5),
            maxCapacity: 10,
            timeRange: "12pm-2pm",
          ),
          Schedule(
            date: DateTime(2022, 12, 20),
            maxCapacity: 10,
            timeRange: "11am-2pm",
          )
        ])
  ];

  List<Doctor> get getDoctors{

    return[..._list] ;

  }

  Doctor findById(String? id){
    return getDoctors.firstWhere((doc) => doc.name == id);
  }

}
