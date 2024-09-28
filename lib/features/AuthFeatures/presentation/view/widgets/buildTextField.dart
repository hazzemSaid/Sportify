import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required IconData icon,
}) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $label';
      }
      return null;
    },
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      label: Text(label, style: const TextStyle(color: Colors.grey)),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      prefixIcon: Icon(icon, size: 28, color: Colors.grey),
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
    ),
  );
}
