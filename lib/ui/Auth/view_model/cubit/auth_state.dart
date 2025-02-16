part of 'auth_cubit.dart';

/// 🌟 Base Auth State 🌟
sealed class AuthState {}

/// 🔹 Initial State 🔹
final class AuthInitial extends AuthState {}

/// =====================================================
/// 🚀 SIGN UP STATES 🚀
/// =====================================================

/// 🎉 Signup Success 🎉
final class SignupSuccessState extends AuthState {
  UserResponse? userResponse;
  SignupSuccessState({required this.userResponse});
}

/// ⏳ Signup Loading ⏳
final class SignupLoadingState extends AuthState {}

/// ❌ Signup Error ❌
final class SignupErrorState extends AuthState {
  String? message;
  SignupErrorState({required this.message});
}

/// =====================================================
/// 🔑 LOGIN STATES 🔑
/// =====================================================

/// ✅ Login Success ✅
final class LoginSuccessState extends AuthState {
  UserResponse? userResponse;
  LoginSuccessState({required this.userResponse});
}

/// ⏳ Login Loading ⏳
final class LoginLoadingState extends AuthState {}

/// ❌ Login Error ❌
final class LoginErrorState extends AuthState {
  String? message;
  LoginErrorState({required this.message});
}

/// =====================================================
/// ✉️ FORGOT PASSWORD STATES ✉️
/// =====================================================

/// 📩 Email Verification Sent Successfully 📩
final class SendEmailVerificationSuccessState extends AuthState {
  bool isSent;
  SendEmailVerificationSuccessState({required this.isSent});
}

/// ⏳ Sending Email Verification ⏳
final class SendEmailVerificationLoadingState extends AuthState {
  SendEmailVerificationLoadingState();
}

/// ❌ Email Verification Failed ❌
final class SendEmailVerificationErrorState extends AuthState {
  String? message;
  SendEmailVerificationErrorState({required this.message});
}

/// =====================================================
/// 🔐 RESET PASSWORD STATES 🔐
/// =====================================================

/// 🔑 Reset Code Verified Successfully 🔑
final class VerifyResetCodeSuccessState extends AuthState {
  bool isVerified;
  VerifyResetCodeSuccessState({required this.isVerified});
}

/// ⏳ Verifying Reset Code ⏳
final class VerifyResetCodeLoadingState extends AuthState {
  VerifyResetCodeLoadingState();
}

/// ❌ Reset Code Verification Failed ❌
final class VerifyResetCodeErrorState extends AuthState {
  String? message;
  VerifyResetCodeErrorState({required this.message});
}

/// =====================================================
/// 🔄 PASSWORD RESET STATES 🔄
/// =====================================================

/// ✅ Password Reset Successfully ✅
final class ResetPasswordSuccessState extends AuthState {
  bool isChanged;
  ResetPasswordSuccessState({required this.isChanged});
}

/// ⏳ Resetting Password ⏳
final class ResetPasswordLoadingState extends AuthState {
  ResetPasswordLoadingState();
}

/// ❌ Password Reset Failed ❌
final class ResetPasswordErrorState extends AuthState {
  String? message;
  ResetPasswordErrorState({required this.message});
}
