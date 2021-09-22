import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../entities/gender.dart';

class GenderRadioButton extends StatelessWidget {
  final Gender _gender;

  const GenderRadioButton({
    Key? key,
    @required gender,
  })  : assert(gender != null),
        this._gender = gender,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(
                color: _gender.selected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: _gender.icon,
          ),
          Text(
            _gender.name,
            style: TextStyle(
                color: _gender.selected ? Colors.black : Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}