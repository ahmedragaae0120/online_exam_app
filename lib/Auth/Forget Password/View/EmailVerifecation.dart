import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/PutNewPassword.dart';
import 'package:online_exam_app/Auth/Forget%20Password/widgets/custom_verification.dart';
import 'package:online_exam_app/config.dart';

class EmailVerification extends StatelessWidget {
  static const routeName = '/EmailVerification';
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
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
                  "Email verification",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            SizedBox(height: Config.screenHight! * 0.012),
            Align(
              alignment: Alignment.center,
              child: Text('''
Please enter your code that send to your
 email address
''', textAlign: TextAlign.center),
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
                print("Navigator to PutNewPassword");
              },
            ),
            SizedBox(height: Config.screenHight! * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code?"),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      /// Resend the code
                      print("Resend the code");
                    },
                    child: Text(
                      "Resend",
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
