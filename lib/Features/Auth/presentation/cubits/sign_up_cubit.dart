import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void>createUserWithEmailAndPassword(String email,String password,String name) async {
    emit(SignUpLoading());
 var result=await authRepo.createUserWithEmailAndPassword(email, password, name);
result.fold(
        (failure)=>emit(SignUpFailure(errorMessage: failure.errorMessage)),
        (userEntity)=>emit(SignUpSuccess(userEntity: userEntity))
          );
  }
}
