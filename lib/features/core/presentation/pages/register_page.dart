import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterPage extends Page {
  const RegisterPage() : super(key: const ValueKey('RegisterPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const RegisterForm(),
    );
  }
}