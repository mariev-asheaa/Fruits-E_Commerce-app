import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    User ?user;
     try {
        user= await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
      var userEntity=UserModel(email: email, name: name, uid: user.uid);
      addUserData(user: userEntity);
       return right(userEntity);
        }
     on ManualExceptions catch (e) {
      deleteUser(user);
       return left(ServerFailure(errorMessage: e.message));
     }

  }

  @override
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword(String email, String password)async {
    try {
      var user= await firebaseAuthService.userLogIn(email: email, password: password);
      var userEntity=await getUserData(id: user.uid);
      return right(userEntity);
    }
    on ManualExceptions catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle()async {
    User ?user;
    try {
       user= await firebaseAuthService.signInWithGoogle();
      var userEntity=UserModel.fromFirebaseUser(user);
      var isUserExists=await databaseService.checkIfDataExists(path: BackendEndpoints.getUserData, documentId: user.uid);
     if(isUserExists){
      await getUserData(id: user.uid);
     }else{
       addUserData(user: userEntity);
     }
      return right(userEntity);
    }
     catch (e) {
       deleteUser(user);
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook()async{
    User ?user;
    try {
       user= await firebaseAuthService.signInWithFacebook();
      var userEntity=UserModel.fromFirebaseUser(user);
       var isUserExists=await databaseService.checkIfDataExists(path: BackendEndpoints.getUserData, documentId: user.uid);
       if(isUserExists){
         await getUserData(id: user.uid);
       }else{
         addUserData(user: userEntity);
       }
      return right(userEntity);
    }
    catch (e) {
      deleteUser(user);
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async{
    User ?user;
    try {
       user= await firebaseAuthService.signInWithApple();
      var userEntity=UserModel.fromFirebaseUser(user);
       var isUserExists=await databaseService.checkIfDataExists(path: BackendEndpoints.getUserData, documentId: user.uid);
       if(isUserExists){
         await getUserData(id: user.uid);
       }else{
         addUserData(user: userEntity);
       }
      return right(userEntity);
    }
    catch (e) {
      deleteUser(user);
      return left(ServerFailure(errorMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
   await  databaseService.addData(path: BackendEndpoints.addUserData, data: user.toJson(),documentId: user.uid);
  }

deleteUser(User ?user)async{
  if(user!=null){
    await firebaseAuthService.deleteUser();
  }
}

  @override
  Future<UserEntity> getUserData({required String id}) async{
    var userData=await  databaseService.getData(path: BackendEndpoints.getUserData, documentId: id);
    return UserModel.fromJson(userData);
  }
}