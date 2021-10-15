import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_profile_event.dart';
import '../bloc/user_profile_bloc.dart';
import '../widgets/profile_form.dart';

class ProfilePage extends StatelessWidget {
  final UserProfileBloc _userProfileBloc;

  ProfilePage({Key? key})
      : _userProfileBloc = UserProfileBloc(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _userProfileBloc..add(const UserProfileLoadStarted()),
      child: ProfileForm(onSave: (user) {
        _userProfileBloc.add(
          UserProfileUpdateStarted(user: user),
        );

        AutoRouter.of(context).pop();
      }),
    );
  }
}
