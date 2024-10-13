import 'package:flutter/material.dart';

Widget buildPasswordField({
  required TextEditingController password,
  required bool isObscured,
  required VoidCallback onPressed,
}) {
  return TextFormField(
    controller: password,
    obscureText: isObscured,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter Password';
      }
      return null;
    },
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      label: const Text('Password', style: TextStyle(color: Colors.grey)),
      hintText: 'Enter Password',
      hintStyle: TextStyle(color: Colors.grey[400]),
      prefixIcon: const Icon(Icons.lock_outline, size: 28, color: Colors.grey),
      filled: true,
      fillColor: const Color(0xff3F3F3F),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xff2C2C2C)),
        borderRadius: BorderRadius.circular(10),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: onPressed,
      ),
    ),
  );
}
