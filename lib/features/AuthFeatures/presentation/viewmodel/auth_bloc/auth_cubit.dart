import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> sgininwithemail({
    required String emailAddress,
    required String password,
  }) async {
    emit(SginInLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SginInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SginInFailed(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SginInFailed(error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SginInFailed(error: 'The email address is badly formatted.'));
      } else if (e.code == 'user-not-found') {
        emit(SginInFailed(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SginInFailed(error: 'Wrong password provided.'));
      } else {
        emit(SginInFailed(error: 'Sign in failed: ${e.message}'));
      }
    } catch (e) {
      emit(
          SginInFailed(error: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> sginupwithemail({
    required String emailAddress,
    required String password,
  }) async {
    emit(SginUpLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SginUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SginUpFailed(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SginUpFailed(error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SginUpFailed(error: 'The email address is badly formatted.'));
      } else if (e.code == 'user-not-found') {
        emit(SginUpFailed(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SginUpFailed(error: 'Wrong password provided.'));
      } else {
        emit(SginUpFailed(error: 'Sign in failed: ${e.message}'));
      }
    } catch (e) {
      print(e);
      emit(
        SginUpFailed(
          error: ("error : ${e.toString()}"),
        ),
      );
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);

    //i need to decribe the state
    print(change);
    //i need to decribe the current state
    print(change.currentState);
    //i need to decribe the next state
    print(change.nextState);
  }
}
/*  // Firebase registration function
  Future<void> register() async {
    if (!_formRegisterKey.currentState!.validate() || !agreePersonalData) {
      Get.snackbar('Error', 'Please fill all fields and agree to the terms',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    try {
      //traget the firebase auth instance and call the createUserWithEmailAndPassword method
      // Success
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
                  Get.toNamed(AppRoutes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff00A3B7), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded button
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Failed to register. Try again.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }*/
