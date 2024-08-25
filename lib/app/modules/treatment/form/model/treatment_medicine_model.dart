class TreatmentMedicine {
  final String name;
  final String? frequencyType;
  final String? frequency;
  final int? quantity;
  final DateTime startDate;
  final DateTime? endDate;

  TreatmentMedicine({
    required this.name,
    this.frequencyType,
    this.frequency,
    this.quantity,
    required this.startDate,
    this.endDate,
  });
}
