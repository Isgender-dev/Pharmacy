class Categories {
  final int ID;
  final String Name;
  Categories({
    required this.ID,
    required this.Name,
  });
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      ID: json['id'],
      Name: json['name'],
    );
  }
}
