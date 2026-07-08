class UserEntity{
  final String email,name,uid;

  UserEntity({required this.email,required this.name,required this.uid});

  toMap(){
 return{
   'name':name,
   'email':email,
   'uid':uid,
 };
  }


}