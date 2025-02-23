sealed class ProfileIntent {}

class GetProfileIntent extends ProfileIntent {}

class LogoutIntent extends ProfileIntent {}

class UpdateProfileIntent extends ProfileIntent {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  String? password;

  UpdateProfileIntent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.password,
  });
}
