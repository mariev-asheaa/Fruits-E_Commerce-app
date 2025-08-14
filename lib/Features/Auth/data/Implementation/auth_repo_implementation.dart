import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/Features/Auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/core/Services/Firebase_Auth_Service.dart';
import 'package:fruits_e_commerce_app/core/errors/Exceptions.dart';
import 'package:fruits_e_commerce_app/core/errors/Failures.dart';

class AuthRepoImplementation extends AuthRepo{

  final FirebaseAuthService firebaseAuthService;
  AuthRepoImplementation({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email,String password,String name)async {
     try {
       var user= await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
       return right(UserModel.fromFirebaseUser(user));
        }
     on ManualExceptions catch (e) {
       return left(ServerFailure(errorMessage: e.message));
     }

  }

}