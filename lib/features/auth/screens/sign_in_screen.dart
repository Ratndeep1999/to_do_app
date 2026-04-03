import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
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
  bool _isPassVisible = true;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      body: UnfocusKeyboardWidget(
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
                    SizedBox(height: height * 0.025),

                    /// Username InputFieldWidget
                    InputFieldWidget(
                      controller: _userNameController,
                      validator: AuthValidators.userName,
                      hintText: 'Enter your user name',
                      prefix: Icons.person,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Password InputFieldWidget
                    InputFieldWidget(
                      controller: _passwordController,
                      validator: AuthValidators.password,
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
                    SizedBox(height: height * 0.025),

                    /// Sign In Button To Validate
                    ButtonWidget(
                      onButtonPress: onSignInPress,
                      label: "Sign In",
                    ),
                    SizedBox(height: height * 0.075),

                    /// SubLabelWidget
                    SubLabelWidget(label: 'If you are new here then click on'),

                    /// Sign up TextButtonWidget
                    TextButtonWidget(onTap: authNavigation, label: "Sign up"),
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
