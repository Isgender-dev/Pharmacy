class PharmacyMedicines {
  final int ID;
  final String Name;
  final String Description;
  final double Price;
  final double? NewPrice;
  final int CategoryId;
  final int PharmacyId;

  PharmacyMedicines({
    required this.ID,
    required this.Name,
    required this.Description,
    required this.Price,
    required this.NewPrice,
    required this.CategoryId,
    required this.PharmacyId,
  });
  factory PharmacyMedicines.fromJson(Map<String, dynamic> json) {
    return PharmacyMedicines(
      ID: json['id'],
      Name: json['name'],
      Description: json['description'],
      Price: json['price'],
      NewPrice: json['newprice'],
      CategoryId: json['categoryid'],
      PharmacyId: json['pharmacyid'],
    );
  }
}
