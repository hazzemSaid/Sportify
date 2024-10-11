import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showEditNameDialog({
  required BuildContext context,
  required String userName,
  required Function(String) onSaved, // Expect a function that takes a String
}) {
  final TextEditingController _nameController =
      TextEditingController(text: userName);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff2C2C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Text(
          'Edit Name',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          style: const TextStyle(color: Colors.white),
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Enter your name',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final newName = _nameController.text; // Get the updated name
              onSaved(newName); // Pass the updated name to the callback
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('userName', newName); // Save the new name
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xff00A3B7),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xff00A3B7),
              ),
            ),
          ),
        ],
      );
    },
  );
}
