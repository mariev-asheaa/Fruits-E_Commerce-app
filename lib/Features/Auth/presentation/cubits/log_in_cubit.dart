import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());

  final AuthRepo authRepo;

  Future<void>userLogInWithEmailAndPassword(String email,String password) async {
    emit(LogInLoading());
    var result=await authRepo.logInWithEmailAndPassword(email, password);
    result.fold(
            (failure)=>emit(LogInFailure(errorMessage: failure.errorMessage)),
            (userEntity)=>emit(LogInSuccess(userEntity: userEntity))
    );
  }

  Future<void>googleSignIn() async {
    emit(LogInLoading());
    var result=await authRepo.signInWithGoogle();
    result.fold(
            (failure)=>emit(LogInFailure(errorMessage: failure.errorMessage)),
            (userEntity)=>emit(LogInSuccess(userEntity: userEntity))
    );
  }

  Future<void>facebookSignIn() async {
    emit(LogInLoading());
    var result=await authRepo.signInWithFacebook();
    result.fold(
            (failure)=>emit(LogInFailure(errorMessage: failure.errorMessage)),
            (userEntity)=>emit(LogInSuccess(userEntity: userEntity))
    );
  }
}
