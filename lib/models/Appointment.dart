class Appointment {
  final String? doctorName;
  final String? gender;
  final String? specialty;
  final DateTime? date;
  final String? timePeriod;
  final String? hospital;

  Appointment(
      {this.doctorName,
      this.specialty,
      this.date,
      this.timePeriod,
      this.gender,
      this.hospital});
}
