

getData () 
{
  Future.delayed(Duration(seconds:5), (){});
  return 45+45;
}

void main() async{
  
  print("before");
  var res =await getData();
    
  print(res);
  
  print("after");
  
  
}
