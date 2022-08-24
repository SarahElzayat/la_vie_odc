part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessfulState extends LoginState {
  final UserModel userModel;

  LoginSuccessfulState(this.userModel);
}
class LoginErrorState extends LoginState {
  late final String error;

  LoginErrorState(this.error);
}
