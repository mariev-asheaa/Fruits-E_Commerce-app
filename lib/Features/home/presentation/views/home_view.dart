import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/Services/Get_It_Service.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../data/repos/products_repo/products_repo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
