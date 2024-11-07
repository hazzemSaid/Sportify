import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      listener: (context, state) async {
        if (state is SginInLoading) {
          //start the loading indicator but is to slow
          Get.dialog(
            const Center(
              child: CircularProgressIndicator(),
            ),
            barrierDismissible: false,
          );
          await Future.delayed(const Duration(seconds: 1));
        } else if (state is SginInSuccess) {
          Get.snackbar('Login Successful', 'Welcome back',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white);

          _saveLoginStatus();

          Navigator.pushNamed(context, AppRoutes.bottomNavBar);
        } else if (state is SginInFailed) {
          //show the error message
          Get.back();
          Get.snackbar(
              'Incorrect', state.error ?? 'Incorrect email or password',
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
                        buildSocialButton(
                          'assets/icons/google.svg',
                          () async {
                            try {
                              // Trigger the authentication flow
                              final GoogleSignInAccount? googleUser =
                                  await GoogleSignIn().signIn();
                              // Check if the user canceled the sign-in
                              if (googleUser == null) {
                                // The user canceled the sign-in, so we stop here
                                return;
                              }
                              // Obtain the auth details from the request
                              final GoogleSignInAuthentication googleAuth =
                                  await googleUser.authentication;
                              // Create a new credential
                              final AuthCredential credential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleAuth.accessToken,
                                idToken: googleAuth.idToken,
                              );
                              // Once signed in, sign in to Firebase with this credential
                              final UserCredential userCredential =
                                  await FirebaseAuth.instance
                                      .signInWithCredential(credential);
                              // Navigate to HomePage
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.bottomNavBar);
                            } catch (e) {
                              // Handle sign-in errors
                              print(e);
                            }
                          },
                          'Sign in with Google',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.23,
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
