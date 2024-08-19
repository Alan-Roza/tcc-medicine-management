class Medicine {
  final String? imageUrl;
  final String name;
  final String type;
  final int quantity;
  final String expirationDate;
  final int qtyByPackage;
  final int unity;
  final double valuePaid;
  final String importanceLevel;
  final int drawerNumber;

  Medicine({
    this.imageUrl,
    required this.name,
    required this.type,
    required this.quantity,
    required this.expirationDate,
    required this.qtyByPackage,
    required this.unity,
    required this.valuePaid,
    required this.importanceLevel,
    required this.drawerNumber,
  });
}
