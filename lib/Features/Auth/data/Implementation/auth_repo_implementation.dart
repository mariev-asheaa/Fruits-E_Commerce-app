import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/Features/Auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/core/Services/Database_Service.dart';
import 'package:fruits_e_commerce_app/core/Services/Firebase_Auth_Service.dart';
import 'package:fruits_e_commerce_app/core/errors/Exceptions.dart';
import 'package:fruits_e_commerce_app/core/errors/Failures.dart';
import 'package:fruits_e_commerce_app/core/utils/Backend_Endpoints.dart';

class AuthRepoImplementation extends AuthRepo{

  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImplementation({required this.databaseService,required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email,String password,String name)async {
     try {
       var user= await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
      var userEntity=UserModel.fromFirebaseUser(user);
      addUserData(user: userEntity);
       return right(userEntity);
        }
     on ManualExceptions catch (e) {
       return left(ServerFailure(errorMessage: e.message));
     }

  }

  @override
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword(String email, String password)async {
    try {
      var user= await firebaseAuthService.userLogIn(email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    }
    on ManualExceptions catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle()async {
    try {
      var user= await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    }
     catch (e) {
      print(e.toString());
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook()async{
    try {
      var user= await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    }
    catch (e) {
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
   await  databaseService.addData(path: BackendEndpoints.addUserData, data: user.toMap());
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async{
    try {
      var user= await firebaseAuthService.signInWithApple();
      return right(UserModel.fromFirebaseUser(user));
    }
    catch (e) {
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

}