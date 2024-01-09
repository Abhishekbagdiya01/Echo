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

class UserBlocSearchState extends UserBlocState {
  List userData;
  UserBlocSearchState({
    required this.userData,
  });
}

class UserBlocSuccessState extends UserBlocState {
  String successMessage;
  UserBlocSuccessState({
    required this.successMessage,
  });
}

class UserBlocErrorState extends UserBlocState {
  String errorMessage;
  UserBlocErrorState({
    required this.errorMessage,
  });
}

class FollowersLoadedState extends UserBlocState {
  List<UserDataModel> followerList;
  FollowersLoadedState({
    required this.followerList,
  });
}

class fetchAllPostState extends UserBlocState {
  List allPost;
  fetchAllPostState({
    required this.allPost,
  });
}
