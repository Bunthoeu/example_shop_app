part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

@immutable
class AuthLogOutEvent extends AuthEvent {
  const AuthLogOutEvent();
  @override
  List<Object> get props => throw UnimplementedError();
}

@immutable
class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthLogInEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

@immutable
class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthRegisterEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

@immutable
class AuthResetPasswordEvent extends AuthEvent {
  final String email;
  const AuthResetPasswordEvent({required this.email});
  @override
  List<Object> get props => [email];
}
@immutable
class AuthLoadingEvent extends AuthEvent {

  const AuthLoadingEvent();
  @override
  List<Object> get props => [];
}
 class GetUserEvent extends AuthEvent{
  
 }
