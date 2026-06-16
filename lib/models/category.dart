class Category {
  final int CategoryId;
  final String Name;

  Category({
    required this.CategoryId,
    required this.Name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      CategoryId: json['id'],
      Name: json['name'],
    );
  }
}
