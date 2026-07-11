class UserEntity{
  final String email,name,uid;

  UserEntity({required this.email,required this.name,required this.uid});

  toJson(){
 return{
   'name':name,
   'email':email,
   'uId':uid,
 };
  }


}