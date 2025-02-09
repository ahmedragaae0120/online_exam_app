// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* -------------------------------------------------------------------------- */
            /*                        Avatar Section with It's Icon                       */
            /* -------------------------------------------------------------------------- */
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent, shape: BoxShape.circle),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /* -------------------------------------------------------------------------- */
            /* -------------------------------------------------------------------------- */
            SizedBox(
              height: 30,
            ),
            /* -------------------------------------------------------------------------- */
            /*                                 TextFields                                 */
            /* -------------------------------------------------------------------------- */

            /* -------------------------------------------------------------------------- */
            /*                             User Name TextField                            */
            /* -------------------------------------------------------------------------- */
            CustomTextField(
              label: 'User Name',
              placeholder: 'Mohamed123',
            ),
            /* -------------------------------------------------------------------------- */

            /* -------------------------------------------------------------------------- */
            SizedBox(
              height: 30,
            ),

            /* -------------------------------------------------------------------------- */
            /*                        First & Last Name TextFields                        */
            /* -------------------------------------------------------------------------- */
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'First name',
                    placeholder: 'Mohamed',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: CustomTextField(
                    label: 'Last name',
                    placeholder: 'Ahmed',
                  ),
                )
              ],
            ),
            /* -------------------------------------------------------------------------- */
            SizedBox(
              height: 30,
            ),

            /* -------------------------------------------------------------------------- */
            /*                               Email TextField                              */
            /* -------------------------------------------------------------------------- */
            CustomTextField(
              label: 'Email',
              placeholder: 'Mohamed.Ahmed@gmail.com',
            ),
            /* -------------------------------------------------------------------------- */
            /* -------------------------------------------------------------------------- */
            SizedBox(
              height: 30,
            ),

            /* -------------------------------------------------------------------------- */
            /*                             Password TextField                             */
            /* -------------------------------------------------------------------------- */
            CustomPasswordField(label: 'Password'),
            /* -------------------------------------------------------------------------- */
            /* -------------------------------------------------------------------------- */

            SizedBox(
              height: 30,
            ),

            /* -------------------------------------------------------------------------- */
            /*                           Phone Number TextField                           */
            /* -------------------------------------------------------------------------- */
            CustomTextField(
              label: 'Phone Number',
              placeholder: '1212312312433',
            ),
            /* -------------------------------------------------------------------------- */
            /* -------------------------------------------------------------------------- */
            SizedBox(
              height: 70,
            ),
            /* -------------------------------------------------------------------------- */
            /* -------------------------------------------------------------------------- */

            /* -------------------------------------------------------------------------- */
            /*                                Update Button                               */
            /* -------------------------------------------------------------------------- */
            Expanded(child: CustomButton(onTap: (){},text: 'Update'))
            /* -------------------------------------------------------------------------- */
          ],
        ),
      ),
    );
  }
}
