part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStart extends AuthEvent {}

class LoggedIn extends AuthEvent {
  String uid;
  LoggedIn({
    required this.uid,
  });
}

class LoggedOut extends AuthEvent {}
