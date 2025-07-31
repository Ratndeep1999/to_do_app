import 'package:flutter/material.dart';

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
      body: SafeArea(
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
                    if ( fullName == null || fullName.isEmpty) {
                      return 'Please enter your full name' ;
                    }
                    if (fullName.length < 6 ) {
                      return 'Full name length must be 6' ;
                    }
                    return null ;
                  } ,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                /// Username
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                /// Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                /// Phone no.
                TextFormField(
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile no.',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: () {
                      if ( _formKey.currentState!.validate()) {
                        debugPrint('Data Processing.....');
                      } else {
                        debugPrint('Invalid Details all or any fields are not validate');
                      }

                    },
                    child: Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
