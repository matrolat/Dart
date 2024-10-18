
class Parent
{
  String? a,b;
  Parent({this.a, this.b});
}


class Child extends Parent{
  Child(String x, String y) : super(a:x, b:y)
  {

  }
}

void  main()
{
  Child c = Child("sameer", "swankar");

  print(c.a);

}