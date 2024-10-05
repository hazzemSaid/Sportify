import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/buildPasswordField.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/buildSocialButton.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/buildTextField.dart';
import 'package:sportify/features/AuthFeatures/presentation/viewmodel/auth_bloc/auth_cubit.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

  bool _isObscured = true;
  bool agreePersonalData = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SginUpLoading) {
          Get.dialog(
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xff00A3B7),
              ),
            ),
            barrierDismissible: false,
          );
        } else if (state is SginUpSuccess) {
          Get.dialog(
            AlertDialog(
              backgroundColor: const Color(0xff2C2C2C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Registration Successful',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/success.gif",
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You have successfully created an account!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Navigator.pushNamed(context, AppRoutes.favfootballteam);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xff00A3B7), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded button
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            barrierDismissible:
                false, // Prevent the dialog from closing by tapping outside
          );
        } else if (state is SginUpFailed) {
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
                    "Welcome To Sportify",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Create an account to explore amazing features",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 35),
                  Form(
                    key: _formRegisterKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        buildTextField(
                          controller: firstname,
                          label: 'First Name',
                          hint: 'Enter First Name',
                          icon: Icons.person_2_outlined,
                        ),
                        const SizedBox(height: 20),
                        buildTextField(
                          controller: lastname,
                          label: 'Last Name',
                          hint: 'Enter Last Name',
                          icon: Icons.person_2_outlined,
                        ),
                        const SizedBox(height: 20),
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
                          onpressedF: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Checkbox(
                              value: agreePersonalData,
                              onChanged: (value) {
                                setState(() {
                                  agreePersonalData = value!;
                                });
                              },
                              activeColor: const Color(0xff00A3B7),
                            ),
                            const Flexible(
                              child: Text(
                                'I agree to the processing of my personal data',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          onPressed: () {
                            if (_formRegisterKey.currentState!.validate()) {
                              print(email.text);
                              print(password.text);
                              BlocProvider.of<AuthCubit>(context)
                                  .sginupwithemail(
                                emailAddress: email.text,
                                password: password.text,
                              );
                            }
                          },
                          text: "Register",
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
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.loginScreen);
                              },
                              child: const Text(
                                "Login",
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
}
