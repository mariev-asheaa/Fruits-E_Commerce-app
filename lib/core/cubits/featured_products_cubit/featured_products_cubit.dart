import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Features/home/data/repos/products_repo/products_repo.dart';
import '../../../Features/home/domain/entities/product_entity.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  FeaturedProductsCubit(this.productsRepo) : super(FeaturedProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getFeaturedProducts() async {
    emit(FeaturedProductsLoading());
    final result = await productsRepo.getFeaturedProducts();
    result.fold(
      (failure) => emit(FeaturedProductsFailure(failure.errorMessage)),
      (products) {
        emit(FeaturedProductsSuccess(products));
      },
    );
  }
}
