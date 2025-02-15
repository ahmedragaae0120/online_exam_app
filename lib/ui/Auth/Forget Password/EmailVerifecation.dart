// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/ui/Auth/widgets/custom_verification.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.password),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Config.screenHight! * 0.03),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.emailVerification,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            SizedBox(height: Config.screenHight! * 0.012),
            Align(
              alignment: Alignment.center,
              child: Text(AppStrings.sendedCode, textAlign: TextAlign.center),
            ),
            SizedBox(height: Config.screenHight! * 0.05),
            CustomVerification(
              onValidate: () {
                ///===================================================================
                /// here to compare the value with the code to show validation massage
                ///  like this  return value == '2222' ? null : 'Pin is incorrect';
                ///===================================================================
              },
              onComplete: () {
                Navigator.pushNamed(context, PutNewPassword.routeName);
              },
            ),
            SizedBox(height: Config.screenHight! * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.dontRecieveCode),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      /// Resend the code
                    },
                    child: Text(
                      AppStrings.resend,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
