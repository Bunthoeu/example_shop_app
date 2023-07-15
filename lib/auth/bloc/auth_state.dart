part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isloading;
  final bool successful;
  const AuthState({required this.isloading, required this.successful});

  @override
  List<Object> get props => [];
}

class AuthLogedInState extends AuthState {
 const AuthLogedInState({required isloading, required successful})
      : super(isloading: isloading, successful: successful);
        @override
  List<Object> get props => [isloading,successful];
}

class AuthLogedOutState extends AuthState {
 const AuthLogedOutState({required isloading, required successful})
      : super(isloading: isloading, successful: successful);
        @override
  List<Object> get props => [isloading,successful];
}
class AuthLoading extends AuthState {
 const AuthLoading({required isloading, required successful})
      : super(isloading: isloading, successful: successful);
        @override
  List<Object> get props => [isloading,successful];
}




