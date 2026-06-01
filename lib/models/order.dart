class Orders {
  final int ID;
  final String Name;
  final double Price;
  final String Description;

  Orders({
    required this.ID,
    required this.Name,
    required this.Price,
    required this.Description,
  });
  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      ID: json['id'],
      Name: json['name'],
      Price: json['price'],
      Description: json['description'],
    );
  }
}
