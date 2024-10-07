import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image; // Variable to store the selected image
  final ImagePicker _picker = ImagePicker();
  String _userName = 'Ahmed Asaad'; // Variable to store the user name

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showEditNameDialog() {
    final TextEditingController _nameController =
        TextEditingController(text: _userName);

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
              onPressed: () {
                setState(() {
                  _userName = _nameController.text; // Update the user name
                });
                Navigator.of(context).pop(); // Close the dialog
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
                Navigator.of(context).pop(); // Close the dialog
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: SingleChildScrollView(
        // Wrap the Column in a SingleChildScrollView
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 315,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:
                          _pickImage, // Open image picker when avatar is tapped
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: _image != null
                                ? FileImage(_image!) as ImageProvider
                                : const AssetImage('assets/images/avatar.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _userName, // Display the user name
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Profile options section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRow(
                    title: 'MY TEAMS',
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.pushNamed(context, '/favfootballteam');
                    },
                    color: Colors.white,
                  ),
                  const Text(
                    'Follow your favorite teams for personalized\ncontent and recommendations.',
                    style: TextStyle(
                      color: Color(0xffADABAB),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomRow(
                    title: 'EDIT NAME',
                    icon: Icons.edit,
                    onPressed: _showEditNameDialog, // Show dialog when pressed
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'OTHER OPTIONS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomRow(
                    title: 'Privacy',
                    onPressed: () {},
                    icon: Icons.arrow_forward_ios,
                    color: const Color(0xffADABAB),
                  ),
                  const SizedBox(height: 5),
                  CustomRow(
                    title: 'Customer Support',
                    onPressed: () {},
                    icon: Icons.arrow_forward_ios,
                    color: const Color(0xffADABAB),
                  ),
                  const SizedBox(height: 5),
                  CustomRow(
                    title: 'App info',
                    onPressed: () {},
                    icon: Icons.arrow_forward_ios,
                    color: const Color(0xffADABAB),
                  ),
                  const SizedBox(height: 20),
                  // Log out option placed at the bottom
                  CustomRow(
                    title: 'Log out',
                    onPressed: () {},
                    icon: Icons.logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    required this.color,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 18,
          ),
        ),
        if (icon != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: color,
            iconSize: 20,
          ),
      ],
    );
  }
}
