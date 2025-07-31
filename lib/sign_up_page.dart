import 'package:flutter/material.dart';
import 'package:to_do_app/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    SizedBox(height: 50),

                    /// Full name
                    TextFormField(
                      controller: _fullNameController,
                      validator: (fullName) {
                        if (fullName == null || fullName.isEmpty) {
                          return 'Please enter your full name';
                        }
                        if (fullName.length < 6) {
                          return 'Full name length must be 6';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.face),
                        hintText: 'Enter your full name',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),

                    /// Username
                    TextFormField(
                      controller: _userNameController,
                      validator: (userName) {
                        if (userName == null || userName.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),

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
                        hintText: 'Enter your mobile no.',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.075),

                    Text(
                      'If you already have account then click on SIGN in',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0
                      ),
                    ),

                    /// Sign in
                    InkWell(
                      onTap: () {
                        // It replace page from sign up to sign in
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
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
}
