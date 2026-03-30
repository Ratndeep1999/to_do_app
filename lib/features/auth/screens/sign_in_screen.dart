import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard.dart';
import 'package:to_do_app/features/auth/screens/sign_up_screen.dart';
import 'package:to_do_app/features/auth/widgets/input_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/button_widget.dart';
import 'package:to_do_app/features/auth/widgets/label_widget.dart';
import 'package:to_do_app/features/auth/widgets/sub_label_widget.dart';
import 'package:to_do_app/features/auth/widgets/text_button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Password visible or not
  bool _isPassVisible = true;

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
      body: UnfocusKeyboard(
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 80.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    /// Sign in LabelWidget
                    LabelWidget(label: 'SIGN in'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Username InputFieldWidget
                    InputFieldWidget(
                      controller: _userNameController,
                      validator: userNameValidation,
                      hintText: 'Enter your user name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Password InputFieldWidget
                    InputFieldWidget(
                      controller: _passwordController,
                      validator: passwordValidation,
                      onChanged: (val) => debugPrint("Pass : $val"),
                      hintText: "Enter your password",
                      isObscure: _isPassVisible,
                      prefix: Icons.password,
                      suffix: _isPassVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixTap: () =>
                          setState(() => _isPassVisible = !_isPassVisible),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Sign In Button To Validate
                    ButtonWidget(
                      onButtonPress: onSignInPress,
                      label: "Sign In",
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),

                    /// SubLabelWidget
                    SubLabelWidget(label: 'If you are new here then click on'),

                    /// Sign up TextButtonWidget
                    TextButtonWidget(onTap: authNavigation),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Username Validation
  String? userNameValidation(userName) {
    if (userName == null || userName.isEmpty) {
      return 'Please enter username properly';
    } else if (userName.length < 5) {
      return 'Username must be at least 5 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(userName)) {
      return "Only numbers and latter's are allow";
    }
    if (userName.contains(' ')) {
      return 'Space is not allow';
    }
    return null;
  }

  /// Password Validation
  String? passwordValidation(password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your username properly';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must be contain at least one Uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must be contain at least one Lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must be contain at least one number';
    } else if (!RegExp(r'[!@#$&*_]').hasMatch(password)) {
      return 'Password must be contain at least one special character (!@#\$&*_)';
    }
    if (password.contains(' ')) {
      return 'Space not allow';
    }
    return null;
  }

  ///
  void onSignInPress() {
    if (_formKey.currentState!.validate()) {
      debugPrint('Data Processing.......');
      debugPrint(_userNameController.text);
      debugPrint(_passwordController.text);
    } else {
      debugPrint('Invalid Details, all or some fields are not validates');
      _passwordController.clear();
    }
  }

  ///
  void authNavigation() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  );
}
