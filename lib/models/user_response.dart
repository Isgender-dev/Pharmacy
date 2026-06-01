class UserResponse {
  final int ID;
  final String Name;
  final String Email;
  final String Role;

  UserResponse({
    required this.ID,
    required this.Name,
    required this.Email,
    required this.Role,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      ID: json['id'],
      Name: json['name'],
      Email: json['email'],
      Role: json['role'],
    );
  }
}

