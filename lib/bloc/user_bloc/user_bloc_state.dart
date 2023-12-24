part of 'user_bloc_bloc.dart';

sealed class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserBlocInitial extends UserBlocState {}

class UserBlocLoadingState extends UserBlocState {}

class UserBlocLoadedState extends UserBlocState {
  UserDataModel userData;
  UserBlocLoadedState({
    required this.userData,
  });
  
}

class UserBlocErrorState extends UserBlocState {
  String errorMessage;
  UserBlocErrorState({
    required this.errorMessage,
  });
}
