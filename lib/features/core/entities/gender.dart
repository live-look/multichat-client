import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Gender extends Equatable {
  final String name;
  final Image icon;
  bool selected;

  Gender(this.name, this.icon, this.selected);

  @override
  List<Object> get props => [name, icon, selected];
}