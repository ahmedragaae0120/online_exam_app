import 'user.dart';

class UserResponse {
  String? message;
  String? token;
  User? user;

  UserResponse({this.message, this.token, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };
}
