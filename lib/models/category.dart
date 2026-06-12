class Category {
  final int ID;
  final String Name;

  Category({
    required this.ID,
    required this.Name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      ID: json['id'],
      Name: json['name'],
    );
  }
}
