import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failures.dart';
import '../entities/order_entity.dart';


abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
}