
class Product{
  final a;
  const Product({this.a});
}


void main()
{
  Product obj = const Product(a:34);
  Product obj2 = const Product(a:34);
  print(obj.a);
  print(obj2.a);

}