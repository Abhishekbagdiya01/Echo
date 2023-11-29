part of 'credential_cubit_bloc.dart';

sealed class CredentialCubitEvent extends Equatable {
  const CredentialCubitEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends CredentialCubitEvent {
  final UserModel userModel;
  SignUp({
    required this.userModel,
  });
  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class Login extends CredentialCubitEvent {
  final UserModel userModel;
  Login({
    required this.userModel,
  });
  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class ForgotPassword extends CredentialCubitEvent {
  String email;
  ForgotPassword({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class OTPVerification extends CredentialCubitEvent {
  String email;
  String otp;
  OTPVerification({
    required this.email,
    required this.otp,
  });
  @override
  List<Object> get props => [email, otp];
}

class ResetPassword extends CredentialCubitEvent {
  String email;
  String newPassword;
  ResetPassword({
    required this.email,
    required this.newPassword,
  });
  @override
  List<Object> get props => [email, newPassword];
}
