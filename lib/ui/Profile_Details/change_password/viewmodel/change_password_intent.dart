abstract class ChangePasswordIntent {}

class UpdatePasswordIntent extends ChangePasswordIntent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  UpdatePasswordIntent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
