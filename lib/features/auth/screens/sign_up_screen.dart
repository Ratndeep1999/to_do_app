import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/auth/screens/sign_in_screen.dart';
import 'package:to_do_app/features/auth/widgets/form_widgets/sign_up_form_widget.dart';

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
  bool _isPassVis = true;

  @override
  void dispose() {
    _fullnameCont.dispose();
    _usernameCont.dispose();
    _emailCont.dispose();
    _mobileNoCont.dispose();
    _passwordCont.dispose();
    super.dispose();
  }

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
        child: UnfocusKeyboardWidget(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 30.0),
            child: SignUpFormWidget(
              formKey: _formKey,
              fullnameCont: _fullnameCont,
              usernameCont: _usernameCont,
              emailCont: _emailCont,
              mobileNoCont: _mobileNoCont,
              passwordCont: _passwordCont,
              isPassVisible: _isPassVis,
              onTogglePassword: () => setState(() => _isPassVis = !_isPassVis),
              onSignUpPress: onSignUpPress,
              onNavigate: authNavigation,
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
