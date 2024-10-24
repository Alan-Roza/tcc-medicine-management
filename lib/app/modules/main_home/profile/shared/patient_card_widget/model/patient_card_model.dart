class PatientCard {
  final String imageUrl;
  final String name;
  final DateTime? lastAccess;
  final String gender;
  final int age;
  final String cellphone;
  final String login;

  PatientCard({
    required this.imageUrl,
    required this.name,
    required this.lastAccess,
    required this.gender,
    required this.age,
    required this.cellphone,
    required this.login,
  });
}

