import 'dart:developer';

import 'package:echo/model/user_model.dart';
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
              await UserRepository().getUserById(event.uid,event.token);
          log(userData.toString());
          emit(UserBlocLoadedState(userData: userData));
        } on ServerException catch (errorMessage) {
          emit(UserBlocErrorState(errorMessage: errorMessage.toString()));
        }
      },
    );
  }
}
