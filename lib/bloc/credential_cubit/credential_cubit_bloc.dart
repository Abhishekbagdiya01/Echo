import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'credential_cubit_event.dart';
part 'credential_cubit_state.dart';

class CredentialCubitBloc
    extends Bloc<CredentialCubitEvent, CredentialCubitState> {
  CredentialCubitBloc() : super(CredentialLoadingState()) {
    AuthRepository authRepository = AuthRepository();

    // on<SignUp>((event, emit) async {
    //   try {
    //     emit(CredentialLoadingState());

    //     await authRepository.signUp(event.userModel);
    //     emit(CredentialSuccessState());
    //   } on ServerException catch (e) {
    //     emit(CredentialErrorState(errorMessage: e.errorMessage));
    //   }
    // });

    on<Login>((event, emit) async {
      try {
        emit(CredentialLoadingState());
        await authRepository.logIn(event.userModel);
        emit(CredentialSuccessState());
      } on ServerException catch (e) {
        emit(CredentialErrorState(errorMessage: e.errorMessage));
      }
    });
  }
}
