import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/car_item_entity.dart';
import '../../../domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var carItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      carItem.increaseQuantity();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());
  }
}
