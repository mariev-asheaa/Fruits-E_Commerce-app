import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Helper_Functions/Error_Bar.dart';
import 'main_view_body.dart';


class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return  MainViewBody(currentViewIndex: currentViewIndex);
    // return BlocListener<CartCubit, CartState>(
    //   listener: (context, state) {
    //     if (state is CartItemAdded) {
    //       showBar(context, 'تمت العملية بنجاح');
    //     }
    //     if (state is CartItemRemoved) {
    //       showBar(context, 'تم حذف العنصر بنجاح');
    //     }
    //   },
    //   child: MainViewBody(currentViewIndex: currentViewIndex),
    // );
  }
}