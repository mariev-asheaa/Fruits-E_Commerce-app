import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/cubits/log_in_cubit.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Login_Body.dart';
import 'package:fruits_e_commerce_app/core/Services/Get_It_Service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: LoginBody()),
      ),
    );
  }
}
