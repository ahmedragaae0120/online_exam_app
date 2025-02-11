// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/Validator.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';
import 'package:online_exam_app/utils/string_manager.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppStrings.profile,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  label: AppStrings.userName,
                  placeholder: 'Mohamed123',
                  controller: userNameController,
                  validator: Validator.userName,
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
                    CustomTextField(
                      label: AppStrings.firstName,
                      placeholder: 'Mohamed',
                      validator: Validator.firstName,
                      controller: firstNameController,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CustomTextField(
                      label: AppStrings.lastName,
                      placeholder: 'Ahmed',
                      controller: lastNameController,
                      validator: Validator.lastName,
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
                  label: AppStrings.email,
                  placeholder: 'Mohamed.Ahmed@gmail.com',
                  controller: emailController,
                  validator: Validator.email,
                ),
                /* -------------------------------------------------------------------------- */
                /* -------------------------------------------------------------------------- */
                SizedBox(
                  height: 30,
                ),

                /* -------------------------------------------------------------------------- */
                /*                             Password TextField                             */
                /* -------------------------------------------------------------------------- */
                CustomPasswordField(
                  label: AppStrings.password,
                  controller: passwordController,
                  validator: Validator.password,
                ),
                /* -------------------------------------------------------------------------- */
                /* -------------------------------------------------------------------------- */

                SizedBox(
                  height: 30,
                ),

                /* -------------------------------------------------------------------------- */
                /*                           Phone Number TextField                           */
                /* -------------------------------------------------------------------------- */
                CustomTextField(
                  label: AppStrings.phoneNumber,
                  placeholder: '1212312312433',
                  controller: phoneNumberController,
                  validator: Validator.phoneNumber,
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
                CustomButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        log(AppStrings.updatesDoneSucceffully);
                      }
                    },
                    text: AppStrings.update),

                /* -------------------------------------------------------------------------- */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
