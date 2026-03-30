import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard.dart';
import 'package:to_do_app/features/auth/screens/sign_in_screen.dart';
import 'package:to_do_app/features/auth/widgets/Input_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/button_widget.dart';
import 'package:to_do_app/features/auth/widgets/sub_label_widget.dart';
import 'package:to_do_app/features/auth/widgets/text_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      /// Body
      body: SingleChildScrollView(
        child: UnfocusKeyboard(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    /// FullName InputFieldWidget
                    InputFieldWidget(
                      controller: _fullNameController,
                      hintText: "Enter your full name",
                      validator: fullNameValidation,
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Username InputFieldWidget
                    InputFieldWidget(
                      controller: _userNameController,
                      hintText: "Enter your user name",
                      validator: usernameValidation,
                      icon: Icons.verified_user,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Email InputFieldWidget
                    InputFieldWidget(
                      controller: _emailController,
                      hintText: "Enter your email",
                      validator: emailValidation,
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Phone no. InputFieldWidget
                    InputFieldWidget(
                      controller: _mobileNumberController,
                      hintText: "Enter your ph. number",
                      validator: numberValidation,
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Sign up Button Widget
                    ButtonWidget(
                      onButtonPress: onSignUpPress,
                      label: "Sign Up",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),

                    /// Sub Label Widget
                    SubLabelWidget(
                      label: 'If you already have account then click on',
                    ),

                    /// Sign Up labelWidget
                    TextButtonWidget(onTap: authNavigation, label: "Sign in"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  String? fullNameValidation(fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'Please enter your full name';
    }
    if (fullName.length < 6) {
      return 'Full name length must be 6';
    }
    return null;
  }

  ///
  String? usernameValidation(userName) {
    if (userName == null || userName.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  ///
  String? emailValidation(email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email address';
    }
    return null;
  }

  ///
  String? numberValidation(phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  ///
  void onSignUpPress() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Data Processing.....');
    } else {
      debugPrint('Invalid Details all or any fields are not validate');
    }
  }

  ///
  void authNavigation() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignInScreen()),
  );
}
