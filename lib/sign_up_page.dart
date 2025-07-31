import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey _formKey = GlobalKey<FormState>();

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
            key: _formKey ,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(height: 50,),

                  TextFormField(),
                ],
              ),
            ),
          ),
      ),
    );
  }
}