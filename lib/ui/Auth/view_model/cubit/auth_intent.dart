/// 🌟 Base Auth Intent 🌟
sealed class AuthIntent {}

/// =====================================================
/// 📝 SIGN UP INTENT 📝
/// =====================================================
class SignUpIntent extends AuthIntent {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  /// 🎉 User signs up with required details 🎉
  SignUpIntent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });
}

/// =====================================================
/// 🔑 LOGIN INTENT 🔑
/// =====================================================
class SignInIntent extends AuthIntent {
  final String email;
  final String password;
  final bool rememberMe;

  /// ✅ Trigger login process ✅
  SignInIntent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

/// =====================================================
/// ✉️ FORGOT PASSWORD INTENT ✉️
/// =====================================================
class ForgetPassword extends AuthIntent {
  final String email;

  /// 📩 Request password reset email 📩
  ForgetPassword({required this.email});
}

/// =====================================================
/// 🔐 VERIFY RESET CODE INTENT 🔐
/// =====================================================
class VerifyResetCode extends AuthIntent {
  final String resetCode;

  /// ✅ Verify the password reset code ✅
  VerifyResetCode({required this.resetCode});
}

/// =====================================================
/// 🔄 RESET PASSWORD INTENT 🔄
/// =====================================================
class ResetPassword extends AuthIntent {
  final String email;
  final String NewPassword;

  /// 🔑 Reset user password 🔑
  ResetPassword({required this.email, required this.NewPassword});
}
