import 'dart:convert';

import '../../Features/Auth/data/models/user_model.dart';
import '../../Features/Auth/domain/entities/user_entity.dart';
import '../Services/Shared_Preferences_Singleton.dart';
import '../utils/constants.dart';


UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}