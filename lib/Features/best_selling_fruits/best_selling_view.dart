import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/best_selling_fruits/widgets/best_selling_view_body.dart';
import 'package:fruits_e_commerce_app/core/cubits/products_cubit/products_cubit.dart';

import '../../core/Services/Get_It_Service.dart';
import '../../core/widgets/build_app_bar.dart';
import '../home/data/repos/products_repo/products_repo.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        child: BestSellingViewBody(),
      ),
    );
  }
}