import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/cubits/sign_up_cubit.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/SignUp_Body.dart';
import 'package:fruits_e_commerce_app/core/Services/Get_It_Service.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'Signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: SignupBody()),
      ),
    );
  }
}
