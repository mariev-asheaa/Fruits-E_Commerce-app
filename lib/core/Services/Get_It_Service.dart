import 'package:fruits_e_commerce_app/Features/Auth/data/Implementation/auth_repo_implementation.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/core/Services/Firebase_Auth_Service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImplementation(firebaseAuthService:getIt<FirebaseAuthService>())
  );
}