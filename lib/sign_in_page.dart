import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // password visible or not
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(height: 260),

                  Padding(
                    padding: const EdgeInsets.only(right: 55),
                    child: Text(
                      'Sign In',
                      // textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Username Field
                  TextFormField(
                    controller: _userNameController,
                    validator: (userName) {
                      if (userName == null || userName.isEmpty) {
                        return 'Please enter username properly';
                      } else if (userName.length < 5) {
                        return 'Username must be at least 5 characters';
                      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(userName)) {
                        return "Only numbers and latter's are allow" ;
                      } 
                      if (userName.contains(' ')) {
                        return 'Space is not allow' ;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your user name',
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black26,
                      // prefixIcon: Icon(Icons.verified_user),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Password Field
                  TextFormField(
                    controller: _passwordController,
                    validator: (password) {
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
                    },
                    onChanged: (password) {
                      _formKey.currentState!.validate();
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: Colors.black26,
                      suffixIcon: InkWell(
                        onTap: () {
                          _isPasswordVisible = !_isPasswordVisible;
                          setState(() {});
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  /// Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Sign In Button To Validate
                      ElevatedButton(
                        onPressed: () {
                          // Form Validation
                          if (_formKey.currentState!.validate()) {
                            debugPrint('Data Processing.......');
                            debugPrint(_userNameController.text);
                            debugPrint(_passwordController.text);
                          } else {
                            debugPrint(
                              'Invalid Details, all or some fields are not validates',
                            );
                            _passwordController.clear();
                          }
                        },
                        child: Text('Sign In'),
                      ),
                      // SizedBox(height: 20),

                      /// Sign Up
                      ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
