import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user.dart';

@singleton
class UserService {
  User? _currentUser;

  void setCurrentUser(User? user) {
    _currentUser = user;
  }

  User? getCurrentUser() {
    return _currentUser;
  }

  void clearCurrentUser() {
    _currentUser = null;
  }
}
