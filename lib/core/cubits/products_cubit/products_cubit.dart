import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Features/home/data/repos/products_repo/products_repo.dart';
import '../../../Features/home/domain/entities/product_entity.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int productsLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
          (failure) => emit(ProductsFailure(failure.errorMessage)),
          (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
          (failure) => emit(ProductsFailure(failure.errorMessage)),
          (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }
}