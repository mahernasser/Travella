class UserModel {
  String? name;
  String? email;
  String? uId;
  String? country;

  UserModel({
    required this.uId,
    required this.country,
    required this.email,
    required this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    country = json['country'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'country': country,
      'uId': uId,
    };
  }
}
