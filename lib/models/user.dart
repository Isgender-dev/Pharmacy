class User {
  final int ID;
  final String FirstName;
  final String LastName;
  final String Email;
  final String? Password;
  final String Role;

  User({
    required this.ID,
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Password,
    required this.Role,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      ID: json['id'],
      FirstName: json['firstname'],
      LastName: json['lastname'],
      Email: json['email'],
      Password: json['password'],
      Role: json['role'],
    );
  }
}
