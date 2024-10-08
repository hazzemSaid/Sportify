part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//sginin sgin up
class SginInLoading extends AuthState {}

class SginInSuccess extends AuthState {}

class SginInFailed extends AuthState {
  String? error;
  SginInFailed({required String error});
}

class SginUpLoading extends AuthState {}

class SginUpSuccess extends AuthState {}

class SginUpFailed extends AuthState {
  String? error;
  SginUpFailed({required String error});
}

//forgot password
class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {}

class ForgotPasswordFailed extends AuthState {}

//google sginin
class GoogleSginInLoading extends AuthState {}

class GoogleSginInSuccess extends AuthState {}

class GoogleSginInFailed extends AuthState {}

//phone sginin
class PhoneSginInLoading extends AuthState {}

class PhoneSginInSuccess extends AuthState {}

class PhoneSginInFailed extends AuthState {}

// Logout state
class AuthLoggedOut extends AuthState {}
