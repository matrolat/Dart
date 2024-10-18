

class Parent{
  
  Parent(int parentA)
  {
    print("parent $parentA");
  }
}

class Child extends Parent{
  Child(int childA) : super(34)
  {
    print("parent $childA");
  }
}

class grandChild extends Child{
  grandChild(int a) : super(33)
  {
    print("grandchild $a");
  }
}


void main()   
{
  grandChild a = grandChild(56);
}