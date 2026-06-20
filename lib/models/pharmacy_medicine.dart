class PharmacyMedicine {
  final int ID;
  final String Name;
  final String Description;
  final double Price;
  final double? NewPrice;
  final int CategoryId;
  final int PharmacyId;
  final int Stock;

  PharmacyMedicine({
    required this.ID,
    required this.Name,
    required this.Description,
    required this.Price,
    required this.NewPrice,
    required this.CategoryId,
    required this.PharmacyId,
    required this.Stock,
  });
  factory PharmacyMedicine.fromJson(Map<String, dynamic> json) {
    return PharmacyMedicine(
      ID: json['id'],
      Name: json['name'],
      Description: json['description'],
      Price: json['price'],
      NewPrice: json['new_price'],
      CategoryId: json['category_id'],
      PharmacyId: json['pharmacy_id'],
      Stock: json['stock'],
    );
  }
}
