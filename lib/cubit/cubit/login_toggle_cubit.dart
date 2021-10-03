import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_toggle_state.dart';

class LoginToggleCubit extends Cubit<LoginToggleState> {
  LoginToggleCubit() : super(LoginToggleInitial());

  void toggleLogin() => emit(LoginToggleStateUpdates(true, false));

  void toggleSignIn() => emit(LoginToggleStateUpdates(false, true));
}
