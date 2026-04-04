class UserModel {
  final String fullname;
  final String username;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    required this.fullname,
    required this.username,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  /// Convert to Map
  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "username": username,
      "email": email,
      "phoneNo": phoneNo,
      "password": password,
    };
  }

  /// Convert from Map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullname: json["fullname"],
      username: json["username"],
      email: json["email"],
      phoneNo: json["phoneNo"],
      password: json["password"],
    );
  }
}
