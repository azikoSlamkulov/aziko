import 'dart:convert';
import 'dart:developer';

import 'package:aziko/src/core/error/exception.dart';
import 'package:aziko/src/module/test/http/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

abstract class UserRemoteServices {
  // https://jsonplaceholder.typicode.com/users/
  Future<List<FakeUserModel>> getAllUsers();

  // https://jsonplaceholder.typicode.com/users/1
  Future<FakeUserModel> getAUser(String id);
}

class UserRemoteServicesImpl implements UserRemoteServices {
  final http.Client client;

  UserRemoteServicesImpl({required this.client});

  @override
  Future<FakeUserModel> getAUser(String id) async {
    final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/$id'),
        headers: {'Content-Type': 'app;iction/json'});
    if (response.statusCode == 200) {
      final user = json.decode(response.body);
      return FakeUserModel.fromJson(user);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FakeUserModel>> getAllUsers() async {
    final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/'),
        headers: {'Content-Type': 'app;iction/json'});

    if (response.statusCode == 200) {
      final users = json.decode(response.body);
      List<FakeUserModel> usersList =
          (users as List).map((user) => FakeUserModel.fromJson(user)).toList();
      log('$users');
      return usersList;
      //return (users as List).map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw ServerException();
    }
  }
}
