import 'dart:convert';

import '../../auth.dart';

UserModel authFromJson(Map docMap) =>
    UserModel.fromJson(docMap as Map<String, dynamic>);

String authToJson(UserModel data) => json.encode(data.toJson());

UserModel userToModel(String id, UserEntity entity) => UserModel(
      userID: id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      photoURL: entity.photoURL,
      role: entity.role,
    );

class UserModel extends UserEntity {
  const UserModel({
    userID,
    name,
    phoneNumber,
    email,
    orders,
    shippingAddresses,
    paymentMethods,
    favoritesProducts,
    promocodes,
    reviews,
    photoURL,
    role,
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
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };

  factory UserModel.fromCacheJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toCacheJson() => {
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };
}
