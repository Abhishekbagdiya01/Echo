part of 'credential_cubit_bloc.dart';

sealed class CredentialCubitState extends Equatable {
  const CredentialCubitState();

  @override
  List<Object> get props => [];
}

class CredentialLoadingState extends CredentialCubitState {}

class CredentialSuccessState extends CredentialCubitState {
  UserModel user;
  CredentialSuccessState({
    required this.user,
  });
}

class CredentialErrorState extends CredentialCubitState {
  final String errorMessage;
  CredentialErrorState({
    required this.errorMessage,
  });
}
