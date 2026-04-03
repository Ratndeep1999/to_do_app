import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
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
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      /// Body
      body: SingleChildScrollView(
        child: UnfocusKeyboardWidget(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 30.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    /// FullName
                    InputFieldWidget(
                      controller: _fullNameController,
                      hintText: "Enter your full name",
                      validator: AuthValidators.fullName,
                      icon: Icons.person,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Username
                    InputFieldWidget(
                      controller: _userNameController,
                      hintText: "Enter your user name",
                      validator: AuthValidators.userName,
                      icon: Icons.verified_user,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Email
                    InputFieldWidget(
                      controller: _emailController,
                      hintText: "Enter your email",
                      validator: AuthValidators.email,
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Phone no.
                    InputFieldWidget(
                      controller: _mobileNumberController,
                      hintText: "Enter your ph. number",
                      validator: AuthValidators.number,
                      icon: Icons.phone,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Sign up Button Widget
                    ButtonWidget(
                      onButtonPress: onSignUpPress,
                      label: "Sign Up",
                    ),
                    SizedBox(height: height * 0.075),

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
