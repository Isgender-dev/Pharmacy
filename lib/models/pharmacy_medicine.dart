class PharmacyMedicines {
  final int ID;
  final String Name;
  final String Description;
  final double Price;
  final double New_price;
  final int Category_id;

  PharmacyMedicines({
    required this.ID,
    required this.Name,
    required this.Description,
    required this.Price,
    required this.New_price,
    required this.Category_id,
  });
  factory PharmacyMedicines.fromJson(Map<String, dynamic> json) {
    return PharmacyMedicines(
      ID: json['id'],
      Name: json['name'],
      Description: json['description'],
      Price: json['price'],
      New_price: json['new_price'],
      Category_id: json['category_id'],
    );
  }
}
