import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/Exceptions.dart';

class FirebaseAuthService
{

Future<User>createUserWithEmailAndPassword({required String email,required String password})async
{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw ManualExceptions(message: 'الرقم السري ضعيف جداً.');
    } else if (e.code == 'email-already-in-use') {
      throw ManualExceptions(message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
    }
    else{
      throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  } catch (e) {
   throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
  }
}

}