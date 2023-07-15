import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../api_repository/auth_error.dart';
import '../../api_repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLogedOutState(isloading: false, successful: false)) {
    on<AuthLoadingEvent>((event, emit) async {
      try {
        //     emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogIn = e.toString();
        emit(
          AuthLoading(isloading: true, successful: false),
        );
      }
    });
    on<AuthLogInEvent>((event, emit) async {
      try {
        //     emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
        await AuthRepository()
            .signInWithEmailPassword(event.email, event.password);
        emit(
          AuthLogedInState(isloading: false, successful: true),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogIn = e.toString();
        emit(
          AuthLogedOutState(isloading: false, successful: false),
        );
      }
    });
    on<AuthLogOutEvent>((event, emit) async {
      try {
        //    emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
        await AuthRepository().signOut();
        emit(
          AuthLogedOutState(isloading: false, successful: true),
        );
      } on FirebaseAuthException catch (e) {}
    });
    on<AuthRegisterEvent>((event, emit) async {
      try {
        // emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
        await AuthRepository().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(
          AuthLogedInState(isloading: false, successful: true),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogIn = e.toString();
        emit(
          AuthLogedOutState(isloading: false, successful: false),
        );
      }
    });
    on<AuthResetPasswordEvent>((event, emit) async {
      try {
        //     emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
        await AuthRepository().sendRequestPasswordEmail(email: event.email);
        emit(
          AuthLogedInState(isloading: false, successful: true),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogIn = e.toString();
        emit(
          AuthLogedOutState(isloading: false, successful: false),
        );
      }
    });
    on<GetUserEvent>((event, emit) async {
      try {
        //     emit(
        //   AuthLogedOutState(isloading: true, successful: false),
        // );
        await AuthRepository().getCurrentUser();
        emit(
          AuthLogedInState(isloading: false, successful: true),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogIn = e.toString();
      }
    });
  }
}
