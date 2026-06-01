class Pharmacies {
  final int ID;
  final String Name;
  final String Address;
  final int Pharmacy_hours;

  Pharmacies({
    required this.ID,
    required this.Name,
    required this.Address,
    required this.Pharmacy_hours,
  });
  factory Pharmacies.fromJson(Map<String, dynamic> json) {
    return Pharmacies(
      ID: json['id'],
      Name: json['name'],
      Address: json['address'],
      Pharmacy_hours: json['pharmacy_hours'],
    );
  }
}
