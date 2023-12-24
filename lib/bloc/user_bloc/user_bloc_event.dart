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
