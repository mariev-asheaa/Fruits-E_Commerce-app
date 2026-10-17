import 'package:dartz/dartz.dart';

import '../../../../core/Services/database_service.dart';
import '../../../../core/errors/Failures.dart';
import '../../../../core/utils/Backend_Endpoints.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/orders_repo.dart';
import '../models/order_model.dart';


class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity order}) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await dataBaseService.addData(
        path: BackendEndpoints.addOrder,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}