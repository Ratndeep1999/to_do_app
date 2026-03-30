import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard.dart';
import 'package:to_do_app/features/auth/screens/sign_in_screen.dart';
import 'package:to_do_app/features/auth/widgets/Input_field_widget.dart';

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

                    /// Username
                    TextFormField(
                      controller: _userNameController,
                      validator: usernameValidation,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'Enter username',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Email
                    TextFormField(
                      controller: _emailController,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        hintText: 'Enter your email address',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    /// Phone no.
                    TextFormField(
                      controller: _mobileNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (phoneNumber) {
                        if (phoneNumber == null || phoneNumber.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Enter your mobile number.',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Data Processing.....');
                        } else {
                          debugPrint(
                            'Invalid Details all or any fields are not validate',
                          );
                        }
                      },
                      child: Text('Save'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),

                    Text(
                      'If you already have account then click on SIGN in',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),

                    /// Sign in
                    InkWell(
                      onTap: () {
                        // It replace page from sign up to sign in
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'SIGN in',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
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
}
