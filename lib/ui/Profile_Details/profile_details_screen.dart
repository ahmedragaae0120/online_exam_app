import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/widgets/custom_text_field.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
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
        title: Text('Profile Details'),
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
                    label: 'Username',
                    placeholder: 'Enter your username',
                    controller: _usernameController,
                  ),
                  // ... other widgets ...
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        label: 'Firstname',
                        placeholder: 'Enter your firstname',
                        controller: _firstNameController,
                      ),
                      SizedBox(width: 16),
                      CustomTextField(
                        label: 'Lastname',
                        placeholder: 'Enter your lastname',
                        controller: _lastNameController,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  CustomTextField(
                    label: 'Email',
                    placeholder: 'Enter your e-mail',
                    controller: _emailController,
                  ),
                  SizedBox(height: 16),

                  CustomTextField(
                    label: 'Phone number',
                    placeholder: 'Enter your phone number',
                    controller: _phoneController,
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                    text: 'Update',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final updateIntent = UpdateProfileIntent(
                          username: _usernameController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        );

                        // Only include password if user entered a new one
                        if (_passwordController.text.isNotEmpty) {
                          updateIntent.password = _passwordController.text;
                        }

                        context.read<ProfileCubit>().doIntent(updateIntent);
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Logout',
                    onTap: () {
                      context.read<ProfileCubit>().doIntent(LogoutIntent());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppStrings.loginScreenRoute,
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
