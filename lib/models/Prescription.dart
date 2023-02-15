class Prescription {
  final String? id;
  final String? title;
  final String? form;
  final String? strength;
  final List<Dosage>?  dosage;
  final int? frequency;
  final String? diet;

  Prescription(
      {this.id,
      this.title,
      this.form,
      this.strength,
      this.dosage,
      this.frequency,
      this.diet});
}

class Dosage {
  DateTime? dateTime;
  String? quantity;

  Dosage({
    this.dateTime,
    this.quantity,
  });
}
