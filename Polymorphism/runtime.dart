

class Parent{
  String? a;

  Parent()
  {

  }


  factory Parent.method()
  {
    return Child();
  }



}

class Child extends Parent{
  String? b;
}
void main()
{
  Parent o = Child();
  print(o.a);
}