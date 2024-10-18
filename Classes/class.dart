

class Product{
  String? name;
  String? companyName;
  double? price;

  void display()
  {
    print(name);
    print(companyName);
    print(price);
  }
}

void main()
{
    Product a = Product();
    a.name = "Mouse";
    a.companyName = "Razor";
    a.price = 1000.0; 


    a.display();

}