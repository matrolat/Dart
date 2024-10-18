



class Product{
  String? name;
  String? companyName;
  double? price;

  Product(
   {  this.name,
    this.companyName,
    this.price}
     
  );


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
    a.display();

}