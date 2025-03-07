import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam_app/Shared/widgets/Validator.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/viewmodel/change_password_cubit.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/viewmodel/change_password_intent.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/viewmodel/change_password_state.dart';
import 'package:get_it/get_it.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return BlocProvider(
      create: (context) =>
          GetIt.I<ChangePasswordCubit>(), // Use dependency injection
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            Fluttertoast.showToast(msg: "Password changed successfully");
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppStrings.homeScreenRoute,
              (route) => false,
            );
          } else if (state is ChangePasswordErrorState) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppStrings.homeScreenRoute,
                  (route) => false,
                ),
              ),
              title: Text(
                AppStrings.changePassword,
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Stack(
              children: [
                Form(
                  // Wrap Column with Form
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomPasswordField(
                        label: AppStrings.currentPassword,
                        placeholder: AppStrings.currentPassword,
                        controller: currentPasswordController,
                        validator: (value) => Validator.password(value),
                      ),
                      const SizedBox(height: 30),
                      CustomPasswordField(
                        label: AppStrings.newPassword,
                        placeholder: AppStrings.newPassword,
                        controller: newPasswordController,
                        validator: (value) => Validator.password(value),
                      ),
                      const SizedBox(height: 30),
                      CustomPasswordField(
                        label: AppStrings.confirmPassword,
                        placeholder: AppStrings.confirmPassword,
                        controller: confirmPasswordController,
                        validator: (value) => Validator.confirmPassword(
                          value,
                          newPasswordController.text,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final cubit = context.read<ChangePasswordCubit>();
                            cubit.doIntent(
                              UpdatePasswordIntent(
                                currentPassword: currentPasswordController.text,
                                newPassword: newPasswordController.text,
                                confirmPassword: confirmPasswordController.text,
                              ),
                            );
                          }
                        },
                        text: 'Update Password',
                      ),
                    ],
                  ),
                ),
                if (state is ChangePasswordLoadingState)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
