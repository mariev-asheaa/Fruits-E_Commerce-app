class ManualExceptions implements Exception
{
  final String message;

  ManualExceptions({required this.message});

  @override
  String toString(){
    return message;
  }
}