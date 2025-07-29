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
                  SizedBox(height: 350),

                  /// Username Field
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your user name',
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black26,
                      // prefixIcon: Icon(Icons.verified_user),
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Password Field
                  TextFormField(
                    controller: _passwordController,
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
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  /// Button To Validate
                  ElevatedButton(
                    onPressed: () {
                      // Form Validation
                      if ( _formKey.currentState!.validate()) {
                        debugPrint('Data Processing.......');
                        debugPrint(_userNameController.toString());
                        debugPrint(_passwordController.toString());
                      } else {
                        debugPrint('Invalid Details, all or some fields are not validates');
                        _passwordController.clear();
                      }
                    },
                    child: Text('Sign In'),
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
