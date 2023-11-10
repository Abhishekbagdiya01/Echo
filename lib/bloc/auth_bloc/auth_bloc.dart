import 'package:bloc/bloc.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AppStart>((event, emit) async {
      String? uid = await SharedPref().getUid();

      try {
        if (uid != null) {
          emit(AuthSuccessState(uid: uid));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });

    on<LoggedIn>((event, emit) {
      SharedPref().setUid(event.uid);
      emit(AuthSuccessState(uid: event.uid));
    });

    on<LoggedOut>((event, emit) {
      SharedPref().setUid("");
      emit(UnAuthenticated());
    });
  }
}
