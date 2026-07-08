import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/Exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } else if (e.code == 'network-request-failed') {
      throw ManualExceptions(message: 'تاكد من اتصالك بالانترنت.');
    }
    else{
      throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  } catch (e) {
   throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
  }
}

Future<User>userLogIn({required String email,required String password})async
{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return credential.user!;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw ManualExceptions(message: 'البريد الالكتروني او الرقم السرى غير صحيح.');
    } else if (e.code == 'wrong-password') {
      throw ManualExceptions(message: 'البريد الالكتروني او الرقم السرى غير صحيح.');
    }
    else if (e.code == 'network-request-failed') {
      throw ManualExceptions(message: 'تاكد من اتصالك بالانترنت.');
    }
    else{
      throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  } catch (e) {
    throw ManualExceptions(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
  }
}

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser == null) {
    throw Exception("User cancelled Google Sign-In");
  }

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return  (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}

Future<User> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  return  (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}

}