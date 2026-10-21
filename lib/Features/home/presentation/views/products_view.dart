import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Services/Get_It_Service.dart';
import '../../../../core/cubits/featured_products_cubit/featured_products_cubit.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../data/repos/products_repo/products_repo.dart';
import '../widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<ProductsRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => FeaturedProductsCubit(
            getIt.get<ProductsRepo>(),
          ),
        ),
      ],
      child: const ProductsViewBody(),
    );
  }
}
