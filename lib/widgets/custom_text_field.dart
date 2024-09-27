import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscure = false,
    this.inputType,
    // required this.label,
  });

  Function(String)? onChange;
  String? hintText;
  bool? obscure;
  TextInputType? inputType;
  // TextEditingController label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: label,
      keyboardType: inputType,
      obscureText: obscure!,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
