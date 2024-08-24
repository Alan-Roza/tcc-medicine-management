class TreatmentMedicine {
  final String name;
  final String frequencyType;
  final String frequency;
  final int quantity;
  final DateTime startDate;
  final DateTime? endDate;

  TreatmentMedicine({
    required this.name,
    required this.frequencyType,
    required this.frequency,
    required this.quantity,
    required this.startDate,
    this.endDate,
  });
}
