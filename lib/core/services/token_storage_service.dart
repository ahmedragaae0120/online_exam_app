import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenStorageService {
  final String _tokenKey = 'auth_token';
  final String _rememberMeKey = 'remember_me';

  final SharedPreferences _prefs;

  TokenStorageService(this._prefs);

  Future<void> saveToken(String token, bool rememberMe) async {
    try {
      await _prefs.setBool(_rememberMeKey, rememberMe);
      if (rememberMe) {
        await _prefs.setString(_tokenKey, token);
      } else {
        await _prefs.remove(_tokenKey); // تأكد من حذف التوكن عند عدم التذكّر
      }
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  bool getRememberMe() {
    return _prefs.getBool(_rememberMeKey) ?? false;
  }

  Future<void> deleteToken() async {
    try {
      await _prefs.remove(_tokenKey);
      await _prefs.remove(_rememberMeKey);
    } catch (e) {
      print('Error deleting token: $e');
    }
  }
}
