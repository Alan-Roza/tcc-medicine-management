class TreatmentCard {
  final bool isSelected;
  final String name;
  final int quantity;
  final String expirationDate;
  final String priority;
  final String patientName;
  final double totalPrice;
  final String id;

  TreatmentCard({
    required this.id,
    required this.name,
    required this.quantity,
    required this.expirationDate,
    required this.patientName,
    required this.priority,
    required this.totalPrice,
    this.isSelected = false
  });
}
