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
