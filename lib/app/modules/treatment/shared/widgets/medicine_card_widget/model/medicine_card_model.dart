class MedicineCard {
  final bool isSelected;
  final String? imageUrl;
  final String name;
  final String type;
  final int quantity;
  final String expirationDate;
  final double price;
  final String priority;

  MedicineCard({
    this.imageUrl,
    required this.name,
    required this.type,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.priority,
    this.isSelected = false
  });
}
