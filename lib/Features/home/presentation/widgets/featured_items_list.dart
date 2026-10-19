import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/utils/Text_Styles.dart';
import '../../../../core/widgets/custom_network_image.dart';

class FeaturedItemsList extends StatefulWidget {
  const FeaturedItemsList({super.key});

  @override
  State<FeaturedItemsList> createState() => _FeaturedItemsListState();
}

class _FeaturedItemsListState extends State<FeaturedItemsList> {
  @override
  void initState() {
    context.read<ProductsCubit>().getFeaturedProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is FeaturedProductsSuccess) {
          return SizedBox(
              height: 110,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.withValues(alpha: 0.10000000149011612),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CustomNetworkImage(
                              imageUrl: state.products[index].imageUrl??''
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(state.products[index].name, style: Styles.bold13,)
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16),
              )
          );
        } else if (state is FeaturedProductsFailure) {
          return Center(child: Text(state.errorMessage));
        }
        else{
          return Skeletonizer(
            enabled: true,
            child: Row(
                  children:List.generate(5, (index){
                  return  CircleAvatar(radius: 30,backgroundColor: Colors.grey.withValues(alpha: 0.10000000149011612),);
                  }
                  )
                ),
          );
        }
      },
    );
  }
}
