import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multichat/features/core/presentation/pages/register_page.dart';
import 'package:multichat/features/core/presentation/widgets/splash.dart';
import '../../presentation/bloc/auth_bloc.dart';
import '../../presentation/bloc/auth_state.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (_, state) async {
        if (state is AuthSuccess) {
          await context.router.replaceNamed("/home");
          return;
        }
      },
      builder: (_, state) {
        if (state is AuthFailure) {
          return const RegisterPage();
        } else {
          return const Splash();
        }
      },
    );
  }
}
