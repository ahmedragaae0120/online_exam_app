import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenStorageService {
  final SharedPreferences _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _rememberMeKey = 'remember_me';

  TokenStorageService(this._prefs);

  Future<void> saveToken(String token) async {
    try{await _prefs.setString(_tokenKey, token);
    }catch(e){
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
    try{
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_rememberMeKey);
  }catch(e){
      print('Error deleting token: $e');
    }
    }
}
