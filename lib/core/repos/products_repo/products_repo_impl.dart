import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/Services/database_service.dart';
import 'package:fruits_e_commerce_app/core/errors/Failures.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';

import '../../entities/product_entity.dart';
import '../../models/product_model.dart';
import '../../utils/Backend_Endpoints.dart';
class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure( errorMessage: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'Failed to get products'));
    }
  }
}