import 'dart:developer';

import 'package:echo/model/user_model.dart';
import 'package:echo/repository/post_repository.dart';
import 'package:echo/repository/server_exception.dart';
import 'package:echo/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocInitial()) {
    on<UserBlocEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetUserDataEvent>(
      (event, emit) async {
        try {
          emit(UserBlocLoadingState());

          UserDataModel userData =
              await UserRepository().getUserById(event.uid, event.token);
          log(userData.toString());
          emit(UserBlocLoadedState(userData: userData));
        } on ServerException catch (errorMessage) {
          emit(UserBlocErrorState(errorMessage: errorMessage.toString()));
        }
      },
    );

    on<SearchUserEvent>(
      (event, emit) async {
        try {
          emit(UserBlocLoadingState());
          if (event.name != "") {
            List userList = await UserRepository()
                .searchUserByName(event.name, event.token);
            print(userList);
            emit(UserBlocSearchState(userData: userList));
          }
        } on ServerException catch (errorMessage) {
          emit(UserBlocErrorState(errorMessage: errorMessage.toString()));
        }
      },
    );

    on<FollowUserEvent>(
      (event, emit) async {
        try {
          emit(UserBlocLoadingState());
          String successMessage = await UserRepository().followUser(
              event.currentUserId, event.userToFollowId, event.token);
          log(successMessage);
          emit(UserBlocSuccessState(successMessage: successMessage));

          UserDataModel userData = await UserRepository()
              .getUserById(event.userToFollowId, event.token);
          log(userData.toString());
          emit(UserBlocLoadedState(userData: userData));
        } on ServerException catch (errorMessage) {
          emit(UserBlocErrorState(errorMessage: errorMessage.toString()));
        }
      },
    );

    on<UnfollowUserEvent>(
      (event, emit) async {
        try {
          emit(UserBlocLoadingState());
          String successMessage = await UserRepository().unFollowUser(
              event.currentUserId, event.userToUnfollowId, event.token);
          log(successMessage);
          emit(UserBlocSuccessState(successMessage: successMessage));

          UserDataModel userData = await UserRepository()
              .getUserById(event.userToUnfollowId, event.token);
          log(userData.toString());
          emit(UserBlocLoadedState(userData: userData));
        } on ServerException catch (errorMessage) {
          emit(UserBlocErrorState(errorMessage: errorMessage.toString()));
        }
      },
    );

    on<FetchFollowersEvent>((event, emit) async {
      try {
        emit(UserBlocLoadingState());
        List<UserDataModel> followerList = await UserRepository()
            .fetchFollowers(
                followerUid: event.followersUid, token: event.token);
        log("FetchFollowerEvent Token:${event.token}");
        emit(FollowersLoadedState(followerList: followerList));
      } on ServerException catch (e) {
        emit(UserBlocErrorState(errorMessage: e.errorMessage));
      }
    });

    // on<FetchAllPostEvent>((event, emit) async {
    //   try {
    //     emit(UserBlocLoadingState());
    //     final allPostList =
    //         await PostRepository().fetchAllPost(event.uid, event.token);
    //     emit(fetchAllPostState(allPost: allPostList));
    //   } on ServerException catch (e) {
    //     emit(UserBlocErrorState(errorMessage: e.errorMessage));
    //   }
    // });
  }
}
