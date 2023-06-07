import 'dart:convert';

import '../../domain/entities/user_entity.dart';

UserModel userFromJson(Map docMap) =>
    UserModel.fromJson(docMap as Map<String, dynamic>);

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
    final String? userID,
    final String? name,
    final String? phoneNumber,
    final String? email,
    final String? photoURL,
    final String? role,
  }) : super(
          userID: userID,
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          photoURL: photoURL,
          role: role,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toJson() => {
        "userID": userID ?? '',
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };
}
