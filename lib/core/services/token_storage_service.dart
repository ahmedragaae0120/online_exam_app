import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenStorageService {
  static const String TOKEN_KEY = 'auth_token';
  static const String REMEMBER_ME_KEY = 'remember_me';

  final SharedPreferences _prefs;

  TokenStorageService(this._prefs);

  Future<void> saveToken(String token, bool rememberMe) async {
    if (rememberMe) {
      await _prefs.setString(TOKEN_KEY, token);
    }
    await _prefs.setBool(REMEMBER_ME_KEY, rememberMe);
  }

  String? getToken() {
    return _prefs.getString(TOKEN_KEY);
  }

  bool getRememberMe() {
    return _prefs.getBool(REMEMBER_ME_KEY) ?? false;
  }

  Future<void> deleteToken() async {
    await _prefs.remove(TOKEN_KEY);
    await _prefs.remove(REMEMBER_ME_KEY);
  }
}
