import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../entities/gender.dart';
import '../../entities/user.dart';

import 'gender_radio_button.dart';

class GenderSelector extends StatefulWidget {
  final Function(String)? callback;

  const GenderSelector({Key? key, Function(String)? onSelected})
      : callback = onSelected,
        super(key: key);

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  static final _genders = <Gender>[
    Gender(
      User.maleGender,
      Image.asset('assets/images/man.png'),
      true,
    ),
    Gender(
      User.femaleGender,
      Image.asset('assets/images/woman.png'),
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _genders.map((Gender gender) {
        return InkWell(
          child: GenderRadioButton(gender: gender),
          onTap: () {
            setState(() {
              _genders.forEach((element) {
                element.selected = false;
              });

              gender.selected = true;

              widget.callback?.call(gender.name);
            });
          },
        );
      }).toList(),
    );
  }
}
