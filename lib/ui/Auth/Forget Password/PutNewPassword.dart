// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/Validator.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_intent.dart';

class PutNewPassword extends StatefulWidget {
  static const routeName = '/PutNewPassword';

  const PutNewPassword({super.key});

  @override
  State<PutNewPassword> createState() => _PutNewPasswordState();
}

class _PutNewPasswordState extends State<PutNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    void _validateAndUpdatePassword() {
      if (_formKey.currentState!.validate()) {
        AuthCubit.get(context).doIntent(
            ResetPassword(email: email, NewPassword: passwordController.text));
      }
    }

    Config().init(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: app_colors.blue_base,
              ),
            ),
          );
        }

        if (state is ResetPasswordSuccessState) {
          if (state.isChanged) {
            showDialog(
              context: context,
              barrierDismissible: false, // Prevents closing the dialog manually
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 50),
                        SizedBox(height: 10),
                        const Text(
                          "Success!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Your password has been updated.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

            // Wait for 2 seconds, then navigate to login
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, AppStrings.loginScreenRoute);
            });
          }
        }

        if (state is ResetPasswordErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Error : ${state.message}",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.password),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 24,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.resetPassword,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.passwordvalid,
                    textAlign: TextAlign.center,
                  ),
                ),
                /* Password Field */
                CustomPasswordField(
                  label: AppStrings.continu,
                  controller: passwordController,
                  validator: Validator.password,
                ),

                /* Confirm Password Field */
                CustomPasswordField(
                  label: AppStrings.confirmPassword,
                  controller: confirmPasswordController,
                  validator: (value) =>
                      Validator.confirmPassword(value, passwordController.text),
                ),

                /* Continue Button */
                CustomButton(
                  onTap: _validateAndUpdatePassword,
                  text: AppStrings.continu,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
