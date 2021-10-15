import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/user_profile_event.dart';
import '../../entities/user.dart';
import '../../presentation/bloc/user_profile_bloc.dart';
import '../../presentation/bloc/user_profile_state.dart';

import 'package:numberpicker/numberpicker.dart';

import 'gender_selector.dart';

class ProfileForm extends StatefulWidget {
  final Function(User) onSaveCallback;

  const ProfileForm({Key? key, required Function(User) onSave})
      : onSaveCallback = onSave,
        super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  static const int _debounceDurationMs = 500;
  final TextEditingController _nameController = TextEditingController();

  Timer? _debounce;
  bool _usernameValid = true;

  @override
  void dispose() {
    super.dispose();

    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listener: (_, state) {
        if (state is UserProfileLoadSuccess) {
          _nameController.text = state.user.name;
        }
      },
      builder: (_, state) {
        final profileImg =
            state.user.gender == User.maleGender ? "man" : "woman";
        final bgColor = state.user.gender == User.maleGender
            ? Colors.lightBlueAccent
            : Colors.pinkAccent;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Мой профиль'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: bgColor,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 96.0,
                    width: 96.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(48.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/$profileImg.png',
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 64.0,
                      vertical: 0.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Ваше имя",
                            errorText: _usernameValid ? null : 'Введите имя',
                          ),
                          onChanged: (name) {
                            if (_debounce?.isActive ?? false) {
                              _debounce?.cancel();
                            }

                            _debounce = Timer(
                                const Duration(
                                  milliseconds: _debounceDurationMs,
                                ), () {
                              setState(() {
                                _usernameValid = name.isNotEmpty;

                                BlocProvider.of<UserProfileBloc>(context).add(
                                  UserProfileNameChanged(name: name),
                                );
                              });
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Возраст",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        NumberPicker(
                          value: state.user.age,
                          minValue: 16,
                          maxValue: 70,
                          step: 1,
                          haptics: true,
                          axis: Axis.horizontal,
                          itemHeight: 32,
                          itemWidth: 64,
                          onChanged: (age) {
                            BlocProvider.of<UserProfileBloc>(context)
                                .add(UserProfileAgeChanged(age: age));
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Пол",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GenderSelector(
                          initialValue: state.user.gender,
                          onSelected: (gender) {
                            FocusScope.of(context).requestFocus(FocusNode());

                            BlocProvider.of<UserProfileBloc>(context).add(
                              UserProfileGenderChanged(gender: gender),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());

                            setState(() {
                              _usernameValid = state.user.name.isNotEmpty;
                              if (_usernameValid) {
                                widget.onSaveCallback.call(state.user);
                              }
                            });
                          },
                          child: Text("Далее >"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
