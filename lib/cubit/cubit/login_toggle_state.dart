part of 'login_toggle_cubit.dart';

abstract class LoginToggleState extends Equatable {
  const LoginToggleState();

  @override
  List<Object> get props => [];
}

class LoginToggleInitial extends LoginToggleState {
  final bool isLogin = true;
  final bool isSignup = false;

  LoginToggleInitial();

  @override
  List<Object> get props => [
        isLogin,
        isSignup,
      ];
}

class LoginToggleStateUpdates extends LoginToggleState {
  final bool isLogin;
  final bool isSignup;
  LoginToggleStateUpdates(
    this.isLogin,
    this.isSignup,
  );
  @override
  List<Object> get props => [
        isLogin,
        isSignup,
      ];
}
