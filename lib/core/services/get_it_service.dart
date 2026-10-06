import 'package:fruits_e_commerce_app/Features/Auth/data/Implementation/auth_repo_implementation.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/core/Services/database_service.dart';
import 'package:fruits_e_commerce_app/core/Services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';


import '../../Features/home/data/repos/products_repo/products_repo.dart';
import '../../Features/home/data/repos/products_repo/products_repo_impl.dart';
import '../services/firestore_service.dart';


final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImplementation(
          firebaseAuthService:getIt<FirebaseAuthService>(),
          databaseService: getIt<DatabaseService>()
      )
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );
}