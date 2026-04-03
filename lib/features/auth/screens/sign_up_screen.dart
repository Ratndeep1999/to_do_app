import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/auth/screens/sign_in_screen.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/button_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/email_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/full_name_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/password_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/phone_no_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/username_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/sub_label_widget.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/text_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _mobileNoCont = TextEditingController();
  final _passwordCont = TextEditingController();

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
                    FullNameFieldWidget(controller: _fullnameCont),
                    SizedBox(height: height * 0.025),

                    /// Username
                    UsernameFieldWidget(
                      controller: _usernameCont,
                      icon: Icons.verified_user,
                    ),
                    SizedBox(height: height * 0.025),

                    /// Email
                    EmailFieldWidget(controller: _emailCont),
                    SizedBox(height: height * 0.025),

                    /// Phone no.
                    PhoneNoFieldWidget(controller: _mobileNoCont),
                    SizedBox(height: height * 0.025),

                    /// Password
                    PasswordFieldWidget(
                      controller: _passwordCont,
                      icon: Icons.password,
                      isPassVisible: false,
                      onToggle: () {},
                    ),
                    SizedBox(height: height * 0.025),

                    /// SignUp Button
                    ButtonWidget(
                      onButtonPress: onSignUpPress,
                      label: "Sign Up",
                    ),
                    SizedBox(height: height * 0.075),

                    /// Sub Label
                    SubLabelWidget(
                      label: 'If you already have account then click on',
                    ),

                    /// SignUp Label
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
      debugPrint('Invalid Details all or any field_widgets are not validate');
    }
  }

  ///
  void authNavigation() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignInScreen()),
  );
}
