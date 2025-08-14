import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/Failures.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>>createUserWithEmailAndPassword(String email,String password,String name);
}