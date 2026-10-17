import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/checkout/presentation/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits_e_commerce_app/Features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

import '../../../core/Helper_Functions/get_user.dart';
import '../../../core/Services/Get_It_Service.dart';
import '../../../core/widgets/build_app_bar.dart';
import '../../home/domain/entities/cart_entity.dart';
import '../domain/entities/order_entity.dart';
import '../domain/entities/shipping_address_entity.dart';
import '../domain/repos/orders_repo.dart';
import 'cubits/add_order_cubit.dart';


class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      uID: getUser().uid,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(
            child: CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}