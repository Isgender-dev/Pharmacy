class User {
  final int ID;
  final String Name;
  final String Email;
  final String Password;
  final String Role;

  User({
    required this.ID,
    required this.Name,
    required this.Email,
    required this.Password,
    required this.Role,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      ID: json['id'],
      Name: json['name'],
      Email: json['email'],
      Password: json['email'],
      Role: json['role'],
    );
  }
}
