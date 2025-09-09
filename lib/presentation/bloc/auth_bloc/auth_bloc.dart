import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  AuthBloc() : super(AuthStates()) {
    on<AuthEvent>((event, emit) {
      on<TogglePasswordVisibility>((event, emit) {
        emit(state.copyWith(ispasswordVisible: !state.ispasswordVisible));
      });
    });
  }
}
