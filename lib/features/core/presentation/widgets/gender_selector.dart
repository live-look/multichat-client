import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../entities/gender.dart';
import '../../entities/user.dart';

import 'gender_radio_button.dart';

class GenderSelector extends StatefulWidget {
  final Function(String)? callback;
  final String? _initialValue;

  const GenderSelector(
      {Key? key, String? initialValue, Function(String)? onSelected})
      : callback = onSelected,
        _initialValue = initialValue,// ?? User.maleGender,
        super(key: key);

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> _genders = [];

  @override
  void initState() {
    super.initState();
    _rebuildGenderList();
  }

  @override
  void didUpdateWidget(GenderSelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _rebuildGenderList();
    });
  }

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

  void _rebuildGenderList() {
    _genders = <Gender>[
      Gender(
        User.maleGender,
        Image.asset('assets/images/man.png'),
        widget._initialValue == User.maleGender,
      ),
      Gender(
        User.femaleGender,
        Image.asset('assets/images/woman.png'),
        widget._initialValue == User.femaleGender,
      ),
    ];
  }
}
