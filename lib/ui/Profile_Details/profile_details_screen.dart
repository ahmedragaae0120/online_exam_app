import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/widgets/custom_text_field.dart';
import 'package:online_exam_app/core/utils/app_routes.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/Profile_Details/viewmodel/cubit/profile_cubit.dart';
import 'package:online_exam_app/ui/Profile_Details/viewmodel/cubit/profile_intent.dart';
import 'package:online_exam_app/ui/Profile_Details/viewmodel/cubit/profile_state.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  int selectedLanguage = 0;

  @override
  void initState() {
    super.initState();
    // Fetch profile data when screen loads
    context.read<ProfileCubit>().doIntent(GetProfileIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.profile,
          textAlign: TextAlign.left,
          locale: Locale("en"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (context.locale == Locale('en')) {
                context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('en'));
              }
            },
            child: Text(
              context.locale == Locale('en') ? 'العربية' : 'English',
              style: AppTextStyle.regular16,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoadedState) {
            // Update text controllers with profile data
            _usernameController.text =
                state.profileResponse.user?.username ?? '';
            _firstNameController.text =
                state.profileResponse.user?.firstName ?? '';
            _lastNameController.text =
                state.profileResponse.user?.lastName ?? '';
            _emailController.text = state.profileResponse.user?.email ?? '';
            _phoneController.text = state.profileResponse.user?.phone ?? '';
          }
        },
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Image Section
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),

                  // Form Fields
                  CustomTextField(
                    label: AppStrings.userName,
                    placeholder: AppStrings.enterUserName,
                    controller: _usernameController,
                  ),
                  // ... other widgets ...
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        label: AppStrings.firstName,
                        placeholder: AppStrings.enterYourFirstName,
                        controller: _firstNameController,
                      ),
                      SizedBox(width: 16),
                      CustomTextField(
                        label: AppStrings.lastName,
                        placeholder: AppStrings.enterYourLastName,
                        controller: _lastNameController,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  CustomTextField(
                    label: AppStrings.email,
                    placeholder: AppStrings.enterYourEmail,
                    controller: _emailController,
                  ),
                  SizedBox(height: 16),

                  CustomTextField(
                    label: AppStrings.phoneNumber,
                    placeholder: AppStrings.enterYourPhoneNumber,
                    controller: _phoneController,
                  ),
                  SizedBox(height: 16),
                  // Password Change Section
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomPasswordField(
                        label: AppStrings.password,
                        controller: _passwordController,
                        placeholder: '******',
                      ),
                      Positioned(
                        right: 48,
                        child: TextButton(
                          onPressed: () {
                            print('Change Button Clicked');
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.changePasswordScreenRoute);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          child: Text(
                            AppStrings.change,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                    text: AppStrings.update,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final updateIntent = UpdateProfileIntent(
                          username: _usernameController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        );

                        context.read<ProfileCubit>().doIntent(updateIntent);
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: AppStrings.logout,
                    onTap: () {
                      context.read<ProfileCubit>().doIntent(LogoutIntent());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.loginScreenRoute,
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
