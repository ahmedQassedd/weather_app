import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String? Function(String?)? validator,
  String? label,
  String? hint,
  IconData? suffixIcon,
  Function? suffixPressed,
  InputDecoration? border,
}) =>
    TextFormField(
      cursorColor: Colors.grey,
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffixIcon)),
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
