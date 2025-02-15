// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/widgets/Validator.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_text_field.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

class EnterEmailForgetPassword extends StatefulWidget {
  static const routeName = '/EnterEmailForgetPassword';
  const EnterEmailForgetPassword({super.key});

  @override
  State<EnterEmailForgetPassword> createState() =>
      _EnterEmailForgetPasswordState();
}

class _EnterEmailForgetPasswordState extends State<EnterEmailForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndContinue() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppStrings.emailVerificationScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.password,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Config.screenHight! * 0.03),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.forgetpassword,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.012),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.pleaseEnterEmailsAssociatedToUrAccount,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.05),

              /* Email Field */
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextField(
                    label: AppStrings.email,
                    placeholder: AppStrings.enterYourEmail,
                    controller: emailController,
                    validator: Validator.email,
                  ),
                ],
              ),
              SizedBox(height: Config.screenHight! * 0.06),

              /* Continue Button */
              CustomButton(
                onTap: _validateAndContinue,
                text: AppStrings.continu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
