abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,String?documentId});
  //this getData function is used for both getting single data and getting list of products
  Future<dynamic>getData({required String path, String? documentId, Map<String,dynamic>?query});
  Future<bool>checkIfDataExists({required String path,required String documentId});
}