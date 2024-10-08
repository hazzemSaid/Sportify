import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart'; // استيراد مكتبة path_provider
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/viewmodel/auth_bloc/auth_cubit.dart';
import 'package:sportify/features/Profile/presentation/view/widgets/ShowEditnameDiaolg.dart';
import 'package:sportify/features/home/presentation/view/screens/profile_screen.dart'; // استيراد Cubit

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _userName = 'User Name';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'User Name';
      String? imagePath = prefs.getString('userImage');
      if (imagePath != null) {
        _image = File(imagePath);
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // حفظ الصورة في المسار المناسب
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/${pickedFile.name}';
      await _image!.copy(imagePath);

      // حفظ مسار الصورة في SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userImage', imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: SingleChildScrollView(
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
                      onTap: _pickImage,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: _image != null
                                ? FileImage(_image!) as ImageProvider
                                : const AssetImage('assets/images/avatar.jpeg'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
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
                      _userName,
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
                    onPressed: () {
                      showEditNameDialog(
                        context: context,
                        onSaved: (String name) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('userName', name);
                          setState(() {
                            _userName = name;
                          });
                        },
                        userName: _userName,
                      );
                    },
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
                  CustomRow(
                    title: 'Log out',
                    onPressed: () async {
                      await context
                          .read<AuthCubit>()
                          .logout(); // Ensure logout is complete
                      // Reset login status in SharedPreferences
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);

                      // Clear the navigation stack and navigate to login screen
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes
                            .loginScreen, // Ensure this points to your login screen
                        (Route<dynamic> route) =>
                            false, // Remove all previous routes
                      );
                    },
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
