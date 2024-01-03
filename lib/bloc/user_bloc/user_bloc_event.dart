part of 'user_bloc_bloc.dart';

sealed class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends UserBlocEvent {
  String uid;
  String token;
  GetUserDataEvent({required this.uid, required this.token});
}

class SearchUserEvent extends UserBlocEvent {
  String name;
  String token;
  SearchUserEvent({required this.name, required this.token});
}

class FollowUserEvent extends UserBlocEvent {
  String currentUserId;
  String userToFollowId;
  String token;
  FollowUserEvent(
      {required this.currentUserId,
      required this.userToFollowId,
      required this.token});
}

class UnfollowUserEvent extends UserBlocEvent {
  String currentUserId;
  String userToUnfollowId;
  String token;
  UnfollowUserEvent(
      {required this.currentUserId,
      required this.userToUnfollowId,
      required this.token});
}
