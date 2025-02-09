import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/EmailVerifecation.dart';
import 'package:online_exam_app/Shared/Validator.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';
import 'package:online_exam_app/config.dart';

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
      print('Navigating to EmailVerification');
      Navigator.pushNamed(context, EmailVerification.routeName);
    }
  }


  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
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
                  "Forget password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.012),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '''
Please enter your email associated to 
your account
''',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.05),

              /* Email Field */
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextField(
                    label: 'Email',
                    placeholder: 'Enter your email',
                    controller: emailController,
                    validator:Validator.email,
                  ),
                ],
              ),
              SizedBox(height: Config.screenHight! * 0.06),

              /* Continue Button */
              CustomButton(
                onTap: _validateAndContinue,
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
