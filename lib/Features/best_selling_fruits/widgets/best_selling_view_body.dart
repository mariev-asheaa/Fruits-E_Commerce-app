import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../core/helper_functions/get_dummy_product.dart';
import '../../../core/utils/Text_Styles.dart';
import '../../home/presentation/widgets/products_grid_view.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
  context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
               'الأكثر مبيعًا', textAlign: TextAlign.right, style: Styles.bold16,),
          ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 16,
        ),
      ),
      BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            return ProductsGridView(
              products: state.products,
            );
          } else if (state is ProductsFailure) {
            return SliverToBoxAdapter(
                child: Center(child :Text(state.errMessage)));
          } else {
            return Skeletonizer.sliver(
              enabled: true,
              child: ProductsGridView(
                products: getDummyProducts(),
              ),
            );
          }
        },
      )
        ],
      ),
    );
  }
}