import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/auth/screens/sign_up_screen.dart';
import 'package:to_do_app/features/auth/widgets/sign_in_form_widget.dart';

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
            child: SignInFormWidget(
              formKey: _formKey,
              userNameController: _userNameController,
              passwordController: _passwordController,
              isPassVisible: _isPassVisible,
              onTogglePassword: () =>
                  setState(() => _isPassVisible = !_isPassVisible),
              onSignInPress: onSignInPress,
              onNavigate: authNavigation,
              onPassChanged: (pass) => debugPrint("Password: $pass"),
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
