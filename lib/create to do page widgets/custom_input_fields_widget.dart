import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hint;

  const CustomTextFieldWidget({super.key, required this.hint});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1),
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        // when we see static position
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black26, // Border color when enabled
            width: 1.2, // Border width when enabled
          ),
        ),
        // same as the enabledBorder
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black26, // Border color when enabled
            width: 1.2, // Border width when enabled
          ),
        ),
      ),
    );
  }
}