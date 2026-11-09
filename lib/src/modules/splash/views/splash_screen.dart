import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app_admin/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app_admin/src/modules/auth/views/login_screen.dart';
import 'package:pizza_app_admin/src/modules/home/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            context.go('/home');
            return Container();
          } else if (state.status == AuthenticationStatus.unauthenticated) {
            context.go('/login');
            return Container();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
