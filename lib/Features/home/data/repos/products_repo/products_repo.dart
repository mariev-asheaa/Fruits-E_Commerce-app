import 'package:dartz/dartz.dart';

import '../../../../../core/errors/Failures.dart';
import '../../../domain/entities/product_entity.dart';
abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}