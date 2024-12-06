class UserModel {
  final String? uid;

  final String email;

  final String password;
  final String role;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}