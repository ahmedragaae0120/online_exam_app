import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenStorageService {
  final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _rememberMeKey = 'remember_me';

  TokenStorageService(this._prefs);

  Future<void> saveUserId(String userId) async {
    try {
      await _prefs.setString(_userIdKey, userId);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  Future<String?> getUserId() async {
    return _prefs.getString(_userIdKey);
  }

  Future<void> saveToken(String token) async {
    try {
      await _prefs.setString(_tokenKey, token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  Future<void> saveRememberMe(bool rememberMe) async {
    try {
      await _prefs.setBool(_rememberMeKey, rememberMe);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  Future<bool> isRememberMe() async {
    return _prefs.getBool(_rememberMeKey) ?? false;
  }

  Future<void> clearToken() async {
    try {
      await _prefs.remove(_tokenKey);
      await _prefs.remove(_rememberMeKey);
      final token = await getToken();

      log('✅✅✅ Token Deleted ✅✅✅');
      log(token.toString());
    } catch (e) {
      print('Error deleting token: $e');
    }
  }
}
