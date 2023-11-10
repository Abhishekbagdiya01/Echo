part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState {
  String uid;
  AuthSuccessState({
    required this.uid,
  });
}

class UnAuthenticated extends AuthState {}

class AuthErrorState extends AuthState {
  String errorMessage;
  AuthErrorState({
    required this.errorMessage,
  });
}
