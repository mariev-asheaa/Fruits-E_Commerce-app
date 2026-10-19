import 'package:flutter/material.dart';

import '../views/cart_view.dart';
import '../views/home_view.dart';
import '../views/products_view.dart';


class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
        SizedBox()
      ],
    );
  }
}