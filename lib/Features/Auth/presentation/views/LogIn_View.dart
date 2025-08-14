import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Login_Body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
static const routeName='login';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginBody()),
    );
  }
}
