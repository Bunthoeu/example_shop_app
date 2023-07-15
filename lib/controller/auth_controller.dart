import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:product_shop_api/main_screen.dart';
import 'package:product_shop_api/splash_screen/spal.dart';

import '../api_repository/auth_repository.dart';

import '../auth/bloc/auth_bloc.dart';
import '../splash_screen/splash_screen.dart';


class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthRepository().authStateChange,
        builder: (context, snapshot) {
          return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthLoading) {
              return Splash();
            }
            if (state is AuthLogedInState) {
              return MainScreen();
            }
            if (state is AuthLogedOutState) {
              return IntroScreen();
            }
            return Container();
          });
        });
  }
}
