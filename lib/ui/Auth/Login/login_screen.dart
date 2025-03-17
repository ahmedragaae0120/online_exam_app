import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/Validator.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/widgets/custom_text_field.dart';
import 'package:online_exam_app/Shared/widgets/toast_message.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/core/utils/app_routes.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_intent.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().doIntent(
            SignInIntent(
              email: emailController.text,
              password: passwordController.text,
              // Use the checkbox value
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    final tokenService = getIt<TokenStorageService>();
    tokenService.saveRememberMe(false);
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
          toastMessage(
              message: AppStrings.loginSuccessfully,
              tybeMessage: TybeMessage.positive);
        }
        if (state is LoginErrorState) {
          toastMessage(
              message: state.message.toString(),
              tybeMessage: TybeMessage.negative);
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.login,
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                SizedBox(height: Config.screenHight! * 0.01),

                /* Email Field */
                CustomTextField(
                  label: AppStrings.email,
                  placeholder: AppStrings.enterYourEmail,
                  controller: emailController,
                  validator: Validator.email,
                ),

                /* Password Field */
                CustomPasswordField(
                  label: AppStrings.password,
                  controller: passwordController,
                  validator: Validator.password,
                ),

                /* Remember Me & Forget Password */
                Row(
                  children: [
                    Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          final tokenService = getIt<TokenStorageService>();
                          tokenService.saveRememberMe(isChecked);
                          log(isChecked.toString());
                        });
                      },
                    ),
                    Text(
                      AppStrings.rememberMe,
                      style: AppTextStyle.regular12,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,
                              AppRoutes.enterEmailForgetPasswordScreenRoute);
                        },
                        child: Text(AppStrings.forgetpassword,
                            style: AppTextStyle.regular12),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                /* Login Button */
                CustomButton(
                    onTap: () => _validateAndLogin(context),
                    text: AppStrings.login),

                /* Sign Up Option */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: AppTextStyle.regular16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.singUpScreenRoute);
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: AppTextStyle.medium16.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
