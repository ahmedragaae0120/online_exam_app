import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenStorageService {
  final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _rememberMeKey = 'remember_me';

  TokenStorageService(this._prefs);

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  Future<bool> isRememberMe() async {
    return _prefs.getBool(_rememberMeKey) ?? false;
  }

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_rememberMeKey);
  }
}
