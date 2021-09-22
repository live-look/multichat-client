import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/user_profile_bloc.dart';
import '../widgets/profile_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(),
      child: ProfileForm(
        onSave: (user) {
          BlocProvider.of<AuthBloc>(context).add(
            AuthFormFilled(user: user),
          );
        },
      ),
    );
  }
}
