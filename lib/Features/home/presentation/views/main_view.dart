import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_nav_cubit.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;

          setState(() {});
          context.read<BottomNavCubit>().changeIndex(index);
        },
      ),
      body: SafeArea(
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentViewIndex) {
            return MainViewBodyBlocConsumer(
              currentViewIndex: currentViewIndex,
            );
          },
        ),
      ),
    );
  }
}
