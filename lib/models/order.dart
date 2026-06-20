class Order {
  final int ID;
  final String Name;
  final double Price;
  final String Description;

  Order({
    required this.ID,
    required this.Name,
    required this.Price,
    required this.Description,
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      ID: json['id'],
      Name: json['name'],
      Price: json['price'],
      Description: json['description'],
    );
  }
}
