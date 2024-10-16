import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // استيراد shared_preferences
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/buildPasswordField.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/buildTextField.dart';
import 'package:sportify/features/AuthFeatures/presentation/viewmodel/auth_bloc/auth_cubit.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/widgets/custom_button.dart';

import '../widgets/buildSocialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushNamed(context, AppRoutes.bottomNavBar);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SginInLoading) {
          Get.snackbar('Loading', 'Please wait...',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.blue,
              colorText: Colors.white);
        } else if (state is SginInSuccess) {
          Get.snackbar('Login Successful', 'Welcome back',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white);

          _saveLoginStatus();

          Navigator.pushNamed(context, AppRoutes.bottomNavBar);
        } else if (state is SginInFailed) {
          //stop the loading indicator
          //  Get.back();
          Get.snackbar('Error', state.error ?? 'An error occurred',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2C2C2C),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 20,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Please login to enjoy full feature",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 35),
                  Form(
                    key: _formLoginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        buildTextField(
                          controller: email,
                          label: 'Email',
                          hint: 'Enter Email',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        buildPasswordField(
                          password: password,
                          isObscured: _isObscured,
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPassword);
                              },
                              child: const Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.11,
                        ),
                        CustomButton(
                          onPressed: () {
                            if (_formLoginKey.currentState!.validate()) {
                              context.read<AuthCubit>().signInWithEmail(
                                    emailAddress: email.text,
                                    password: password.text,
                                  );
                            }
                          },
                          text: "Login",
                        ),
                        const SizedBox(height: 25),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Or",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildSocialButton(FontAwesomeIcons.google, () {
                              // Implement Google login
                            }),
                            const SizedBox(width: 30),
                            buildSocialButton(Icons.facebook, () {
                              // Implement Facebook login
                            }),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.registerScreen);
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff00A3B7)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
}
