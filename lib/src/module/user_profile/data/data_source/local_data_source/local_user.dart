import 'dart:convert';

import '../../../../../core/data/local/sharedpreferences/local_storage.dart';
import '../../../../../util/app_constants/texts/app_texts.dart';
import '../../models/user_model.dart';

abstract class LocalUser {
  Future<bool>? addUserToCache(UserModel userModel);
  UserModel? getUserFromCache();
  Future<bool?> clearCache();
}

class SharedPreferencesImpl implements LocalUser {
  final SharedPreferencesDB preferences;
  SharedPreferencesImpl({required this.preferences});

  @override
  Future<bool>? addUserToCache(UserModel userModel) async {
    final userData = json.encode(userModel.toJson());
    return await preferences.setString(
        key: AppTexts.userToCacheKey, value: userData)!;
  }

  @override
  UserModel? getUserFromCache() {
    final user = preferences.getString(key: AppTexts.userToCacheKey);
    if (user == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(user));
  }

  @override
  Future<bool?> clearCache() async {
    return await preferences.remove(key: AppTexts.userToCacheKey);
  }
}

// class LocalAuthImpl implements LocalAuth {
//   final SharedPreferences preferences;
//   LocalAuthImpl({required this.preferences});

//   @override
//   Future<bool>? addUserToCache(AuthModel authModel) async {
//     final _userData = json.encode(authModel.toJson());
//     return await preferences.setString(AppTexts.userToCacheKey, _userData);
//   }

//   @override
//   AuthModel? getUserFromCache() {
//     final _user = preferences.getString(AppTexts.userToCacheKey);
//     if (_user == null) {
//       return null;
//     }
//     return AuthModel.fromCacheJson(json.decode(_user));
//   }

//   @override
//   Future<bool?> clearCache() async {
//     return await preferences.remove(AppTexts.userToCacheKey);
//   }
//}
