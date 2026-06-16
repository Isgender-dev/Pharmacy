class Pharmacies {
  final int ID;
  final String Name;
  final String Address;
  final int Hours;
  final double Latitude;
  final double Longitude;
  final int AdminUserId;

  Pharmacies({
    required this.ID,
    required this.Name,
    required this.Address,
    required this.Hours,
    required this.Latitude,
    required this.Longitude, 
    required this.AdminUserId,
  });
  factory Pharmacies.fromJson(Map<String, dynamic> json) {
    return Pharmacies(
      ID: json['id'],
      Name: json['name'],
      Address: json['address'],
      Hours: json['hours'],
      Latitude: json['latitude'],
      Longitude: json['longitude'], 
      AdminUserId: json['adminuserid'],
    );
  }
}
